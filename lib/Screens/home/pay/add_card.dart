import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Apis/interceptor.dart';
import '../../../model/payment_methods.dart';
import '../../../utill/util_funcs.dart';
import '../../../widgets/app_buttons.dart';
import '../../../widgets/app_text_fields.dart';

class AddCard extends StatefulHookConsumerWidget {
  final double totalAmount;
  final String subtotal;
  final double StateTax;
  final double IuvTax;
  final String user;
  final PaymentMethodModel type;
  const AddCard( {super.key, required this.totalAmount, required this.user,
    required this.type,required this.IuvTax,required this.StateTax,required this.subtotal});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCardState();
}

class _AddCardState extends ConsumerState<AddCard> {
  @override
  Widget build(BuildContext context) {
    final cardNumber = useState("");
    final cardExpiry = useState("");
    final cardHolderName = useState("");
    final cvv = useState("");
    final showBack = useState(false);
    final loading = useState(false);
    final formKey = useRef(GlobalKey<FormState>());

    Future<void> continuePayment() async {
      if (!formKey.value.currentState!.validate()) {
        return;
      }
      formKey.value.currentState!.save();
      loading.value = true;
      try {
        final resp = await api().post(
          'get_token',
          data: {
            'card_number': cardNumber.value.replaceAll(' ', ''),
            'expiry_month': cardExpiry.value.split('/')[0],
            'expiry_date': cardExpiry.value.split('/')[1],
            'cvc_code': cvv.value,
          },
        );
        debugPrint('${resp.data}');
        final resp1 = await api().post(
          'add_payment',
          data: {
            'user_id': widget.user,
            'amount': widget.totalAmount,
            'token': resp.data['result']['id'],
            'currency': 'USD',
          },
        );
        debugPrint('${resp1.data}');
        debugPrint('type for printer ------${widget.type}');
        showSuccessToast(context, message: "Successfull Payment");
      /*  Get.to(PaymentWaitingScreen(type: widget.type, total: widget
            .totalAmount.toString(), IuvTax: widget.IuvTax.toString(),
          StateTax:widget.StateTax.toString() ,
          subtotal: widget.subtotal,));*/

        loading.value = false;
      } catch (e) {
        loading.value = false;
        showError(context, e);
        debugPrint('$e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Card"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sbh((30 / 3.75).w),
                  AppTextFormField(
                    floatingLabel: "Card Number",
                    onChanged: (val) {
                      cardNumber.value = val ?? "";
                    },
                    onTap: () => showBack.value = false,
                    inputFormatters: [CardFormatter(separator: ' ')],
                    validator: (val) => val?.isNotEmpty == true
                        ? val!.length == 19
                            ? null
                            : "Invalid!"
                        : "Required!",
                  ),
                  sbh((20 / 3.75).w),
                  AppTextFormField(
                    floatingLabel: "Card Expiry",
                    onChanged: (val) {
                      cardExpiry.value = val ?? "";
                    },
                    onTap: () => showBack.value = false,
                    inputFormatters: [CardExpirationFormatter()],
                    validator: (val) => val?.isNotEmpty == true
                        ? val!.length == 5
                            ? null
                            : "Invalid!"
                        : "Required!",
                  ),
                  sbh((20 / 3.75).w),
                  AppTextFormField(
                    floatingLabel: "Card Holder Name",
                    onChanged: (val) {
                      cardHolderName.value = val ?? "";
                    },
                    onTap: () => showBack.value = false,
                  ),
                  sbh((20 / 3.75).w),
                  AppTextFormField(
                    floatingLabel: "Card CVV",
                    onChanged: (val) {
                      cvv.value = val ?? "";
                    },
                    onTap: () => showBack.value = true,
                    validator: (val) => val?.isNotEmpty == true ? null : "Required!",
                  ),
                  sbh((30 / 3.75).w),
                  CreditCard(
                    cardNumber: cardNumber.value,
                    cardExpiry: cardExpiry.value,
                    cardHolderName: cardHolderName.value,
                    cvv: cvv.value,
                    bankName: "Bank",
                    showBackSide: showBack.value,
                    frontBackground: CardBackgrounds.black,
                    backBackground: CardBackgrounds.white,
                    showShadow: true,
                    textExpDate: 'Exp. Date',
                    textName: 'Name',
                    textExpiry: 'MM/YY',
                  ),
                  sbh((30 / 3.75).w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [AppButton(onTap: continuePayment, text: 'Continue', loading: loading.value)],
                  ),
                  sbh((30 / 3.75).w),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardFormatter extends TextInputFormatter {
  final String separator;

  CardFormatter({required this.separator});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var oldS = oldValue.text;
    var newS = newValue.text;
    if (newS.length > 19) {
      return newValue.copyWith(
        text: oldS,
        selection: TextSelection.collapsed(
          offset: oldValue.selection.end,
        ),
      );
    }
    var endsWithSeparator = false;

    // if you add text
    if (newS.length > oldS.length) {
      for (var char in separator.characters) {
        if (newS.substring(0, newS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      print('Ends with separator: $endsWithSeparator, so we will add it with next digit.');

      var clean = newS.replaceAll(separator, '');
      print('CLEAN add: $clean');
      if (!endsWithSeparator && clean.length > 1 && clean.length % 4 == 1) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - 1) + separator + newS.characters.last,
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + separator.length,
          ),
        );
      }
    }

    // if you delete text
    if (newS.length < oldS.length) {
      for (var char in separator.characters) {
        if (oldS.substring(0, oldS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      print('Ends with separator: $endsWithSeparator, so we removed it');

      var clean = oldS.substring(0, oldS.length - 1).replaceAll(separator, '');
      print('CLEAN remove: $clean');
      if (endsWithSeparator && clean.isNotEmpty && clean.length % 4 == 0) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - separator.length),
          selection: TextSelection.collapsed(
            offset: newValue.selection.end - separator.length,
          ),
        );
      }
    }

    return newValue;
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newValueString.length && !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}
