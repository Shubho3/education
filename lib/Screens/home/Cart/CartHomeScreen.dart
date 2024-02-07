import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:Education/utill/appImports.dart';

import '../../../Apis/interceptor.dart';
import '../../../model/CartRes.dart';
import '../../../utill/SDP.dart';
import '../pay/select_payment.dart';

class CartHomeScreen extends StatefulWidget {
  const CartHomeScreen({super.key});

  @override
  State<CartHomeScreen> createState() => _CartHomeScreenState();
}

class _CartHomeScreenState extends State<CartHomeScreen> {
  @override
  void initState() {
    super.initState();
    getCart();
  }

  bool loading = true;
  bool data = true;
  CartRes? productRes;
  User? user;
  checkQuantity(String item_quantity, String quantity_status) {
    if (quantity_status.toLowerCase() == 'no') {
      return ''; // Return empty string if quantity_status is 'no'
    } else if (quantity_status.toLowerCase() == 'yes') {
      // Check item_quantity when quantity_status is 'yes'
      int quantity = int.tryParse(item_quantity) ?? 0; // Parse item_quantity as an integer, default to 0 if parsing fails

      if (quantity > 0) {
        return 'Only $item_quantity left'; // Return item_quantity if it's greater than 0
      } else {
        return 'Out of stock'; // Return 'Out of stock' if item_quantity is 0 or not a valid integer
      }
    } else {
      return ''; // Handle other cases by returning an empty string
    }
  }

  void getCart() async {
    user = await getUserDetails();
    setState(() {
      loading = true;
      data = true;
    });

    /* final res = await api().post(
      'get_cart',
      data: {
        "token": user?.token,
        "user_id": user?.id,
      },
    );*/
    var res = await Webservices.postDataWithToken(
        apiUrl: ApiUrls.get_cart,
        body: {
          "token": user!.token,
          "user_id": user!.id,
        },
        context: context);
    try {
      print("---------------------------$res");
      if (res["result"].toString() != "[]") {
        productRes = CartRes.fromJson(res);
        setState(() {
          productRes;
          data = false;
          loading = false;
        });
      } else {
        loading = false;
        data = true;
        setState(() {});
      }
    } catch (e) {
      loading = false;
      data = true;
      setState(() {});
    }

 //   if(checkQuantity(data.itemQuantity!,data.quantityStatus!)=="Out of stock") {}

  }

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      backgroundColor: CC.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 60, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Products In Cart',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    child: loading
                        ? Center(
                            child: Container(
                            margin: EdgeInsets.all(10),
                            child: Lottie.asset('assets/loding.json',
                                width: 80, height: 80, fit: BoxFit.fitHeight),
                          ))
                        : data
                            ? Center(
                                child: Container(
                                child: Column(
                                  children: [
                                    Lottie.asset('assets/empty.json',
                                        width: 180, height: 180),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text(
                                        "Empty Cart",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                          color: CC.themePurple,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: productRes!.result!.length,
                                itemBuilder: (ctx, index) {
                                  Result data = productRes!.result![index];
                                    return Container(
                                    margin: EdgeInsets.all(SDP.sdp(5)),
                                    decoration: BoxDecoration(
                                      color: CC.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 5),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    width: SDP.width! - 30,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              "https://www.orkiosk.com/admin//uploads/images/${data.image!}" ??
                                                  "https://images.unsplash.com/photo-1516743619420-154b70a65fea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                                              width: 100,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 5, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          data.itemName!,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 5, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '\$ ${formatAmount(data.calculateAmount!)}',
                                                              style: TextStyle(
                                                                color: CC
                                                                    .themePurple,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 16.sp,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(15,
                                                              3, 3, 3),
                                                          child: Container(
                                                              child:
                                                              Text(checkQuantity(data.itemQuantity!,data.quantityStatus!)??'',
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                  'Poppins',
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                                  color: CC
                                                                      .black,),
                                                              )

                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: IconButton(
                                                    onPressed: () async {
                                                      await openPopup(
                                                          data, user);
                                                    },
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: CC.themePurple,
                                                    )),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: IconButton(
                                                    onPressed: () {
                                                      productRes!.result!
                                                          .removeAt(index);
                                                      removeFromCart(
                                                          data.cartId!);
                                                      setState(() {});
                                                    },
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: CC.red,
                                                    )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                  ),
                ),
              ],
            ),
/*
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          color: CC.themePurple,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            //  Navigator.push(context, createRoute(const CheckOut()));

                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x38000000),
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 100, 0, 0),
                                        child: SingleChildScrollView(
                                            child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                              Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 1),
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 300, 0, 0),
                                                      child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 500,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF8F7FA),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x320E151B),
                                                                offset: Offset(
                                                                    0, -2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0),
                                                              topLeft: Radius
                                                                  .circular(40),
                                                              topRight: Radius
                                                                  .circular(40),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          12,
                                                                          0,
                                                                          0),
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            30,
                                                                            10,
                                                                            30,
                                                                            10),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              'Checkout',
                                                                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Poppins'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              12,
                                                                              10,
                                                                              10),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Divider(
                                                                            height:
                                                                                32,
                                                                            thickness:
                                                                                2,
                                                                            color:
                                                                                CC.themePurple,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                0,
                                                                                0,
                                                                                8),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                                                                  child: Text(
                                                                                    'Price Breakdown',
                                                                                    style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w500),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Base Price',
                                                                                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500),
                                                                                      ),
                                                                                      Text(
                                                                                        '\$156.00',
                                                                                        textAlign: TextAlign.end,
                                                                                        style: TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Taxes',
                                                                                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500),
                                                                                      ),
                                                                                      Text(
                                                                                        '\$24.20',
                                                                                        textAlign: TextAlign.end,
                                                                                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w600),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Delivery Fee',
                                                                                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500),
                                                                                      ),
                                                                                      Text(
                                                                                        '\$40.00',
                                                                                        textAlign: TextAlign.end,
                                                                                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w600),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Total',
                                                                                            style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Text(
                                                                                        '\$230.20',
                                                                                        style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w700),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),

                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              16,
                                                                              40,
                                                                              16,
                                                                              0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Added to cart!',
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: Colors.red,
                                                                            ),
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                CC.themePurple,
                                                                            borderRadius:
                                                                                BorderRadius.circular(50),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                35,
                                                                                15,
                                                                                35,
                                                                                15),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                Text(
                                                                                  'Place Order!',
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                    fontSize: 22,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 30,
                                                                                  child: VerticalDivider(
                                                                                    thickness: 1,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  '\$ 230.00',
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                    fontSize: 22,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    //hererer
                                                                  ])))))
                                            ]))),
                                  ),
                                );
                              },
                            ).then((value) => (value) => (() {}));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'Check Out',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    color: CC.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
*/
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: data
            ? SizedBox()
            : Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: SDP.sdp(220),
                      height: SDP.sdp(40),
                      decoration: BoxDecoration(
                        color: CC.themePurple,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          //  Navigator.push(context, createRoute(const CheckOut()));

                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, SDP.sdp(80), 0, 0),
                                      child: SingleChildScrollView(
                                          child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                            Align(
                                                alignment:
                                                    AlignmentDirectional(0, 1),
                                                child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0,
                                                                SDP.sdp(200),
                                                                0,
                                                                0),
                                                    child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF8F7FA),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4,
                                                              color: Color(
                                                                  0x320E151B),
                                                              offset:
                                                                  Offset(0, -2),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    40),
                                                            topRight:
                                                                Radius.circular(
                                                                    40),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        12,
                                                                        0,
                                                                        0),
                                                            child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              30,
                                                                              10,
                                                                              30,
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Checkout',
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 20,
                                                                                fontFamily: 'Poppins'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            12,
                                                                            10,
                                                                            10),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Divider(
                                                                          height:
                                                                              32,
                                                                          thickness:
                                                                              2,
                                                                          color:
                                                                              CC.themePurple,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8,
                                                                              0,
                                                                              0,
                                                                              8),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                                                                child: Text(
                                                                                  'Price Breakdown',
                                                                                  style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w500),
                                                                                ),
                                                                              ),
/*
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                12),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'Base Price',
                                                                                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500),
                                                                                ),
                                                                                Text(
                                                                                  '\$data',
                                                                                  textAlign: TextAlign.end,
                                                                                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
*/
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'State Tax',
                                                                                      style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500),
                                                                                    ),
                                                                                    Text(
                                                                                      '\$ ${productRes?.stateTaxAmount}',
                                                                                      textAlign: TextAlign.end,
                                                                                      style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w600),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Mun. Tax',
                                                                                      style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500),
                                                                                    ),
                                                                                    Text(
                                                                                      '\$ ${productRes?.taxAmount}',
                                                                                      textAlign: TextAlign.end,
                                                                                      style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w600),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Total',
                                                                                          style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Text(
                                                                                      '\$ ${productRes?.totalAmount}',
                                                                                      style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w700),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16,
                                                                            40,
                                                                            16,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        Navigator.pop(
                                                                            context);

                                                                        print(
                                                                            "256367534567543");
                                                                        await Navigator.push(
                                                                            context,
                                                                            createRoute(SelectPayment(
                                                                              totalAmount: productRes!.totalAmount!,
                                                                              IUVTax: productRes!.taxAmount!,
                                                                              StateTax: productRes!.stateTaxAmount!,
                                                                              subTotal: productRes!.totalAmount!,
                                                                            )));
                                                                        print(
                                                                            "aaaaaaaaaaaaaaaaa");
                                                                        getCart2();
                                                                        /*  Get.to(SelectPayment(
                                                                    totalAmount:productRes!.totalAmount!,
                                                                    IUVTax: productRes!.taxAmount!,
                                                                    StateTax: productRes!.stateTaxAmount!,
                                                                    subTotal: productRes!.totalAmount!,
                                                                  ));*/
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context)
                                                                            .width,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              CC.themePurple,
                                                                          borderRadius:
                                                                              BorderRadius.circular(50),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              35,
                                                                              15,
                                                                              35,
                                                                              15),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Text(
                                                                                'Place Order!',
                                                                                style: TextStyle(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Colors.white,
                                                                                  fontSize: 22,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 30,
                                                                                child: VerticalDivider(
                                                                                  thickness: 1,
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                '\$ ${productRes?.totalAmount}',
                                                                                style: TextStyle(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Colors.white,
                                                                                  fontSize: 22,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  //hererer
                                                                ])))))
                                          ]))),
                                ),
                              );
                            },
                          ).then((value) => (value) => (() {}));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Check Out',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                  color: CC.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
      ),
    );
  }

  openPopup(Result item, User? user) async {
    await showDialog(
      context: context,
      builder: (context) => SelectDialog(
        isEdit: true,
        item: item,
        addToCart: (price, quantity) {
          // totalPrice.value += price * quantity;
          // getCart();
        },
        isSelected: false,
        user: user!,
      ),
    );
    getCart();
  }

  Future<void> removeFromCart(String id) async {
    try {
      await api().post('remove_from_cart', data: {
        "token": user?.token,
        "user_id": user?.id,
        "cart_id": id,
      });
      getCart();
    } catch (e) {
      debugPrint("${(e as DioError).response}");
    }
  }

  void addtocart(Result data) {}

  getCart2() {
    getCart();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    getCart();
  }
}

class SelectDialog extends StatefulHookConsumerWidget {
  const SelectDialog(
      {super.key,
      required this.item,
      required this.addToCart,
      required this.isEdit,
      required this.isSelected,
      required this.user});

  final Result item;
  final bool? isEdit;
  final bool isSelected;
  final User user;
  final void Function(double price, int quantity) addToCart;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectDialogState();
}

class _SelectDialogState extends ConsumerState<SelectDialog> {
  @override
  Widget build(BuildContext context) {
    final count =
        useState(widget.isEdit! ? int.parse(widget.item.quantity!) : 1);
    final itemCount = useState(List.generate(widget.item.options!.length,
        (index) => widget.item.options![index].statusType == 'true' ? 1 : 0));
    final loading = useState(false);
    final user = useRef<User?>(null);
    final comment = useState(widget.isEdit!
        ? "${widget.item.comment == '0' ? "" : widget.item.comment}"
        : "");
    final commentLabel = useState(widget.isEdit!
        ? "${widget.item.comment == '0' ? "" : widget.item.comment}"
        : "");
    // TextEditingController comment = TextEditingController();

    useEffect(() {
      user.value = widget.user;
      return;
    }, []);

    void addToCart() async {
      print(
          "******************${(double.parse("0${widget.item.itemPrice!}") * double.parse(count.value.toString())) + List.generate(itemCount.value.length, (i) => double.parse("0${widget.item.options![i].price}") * itemCount.value[i]).fold(0, (previousValue, element) => previousValue + element)}");
      loading.value = true;
      try {
        String optionsIds = '';
        for (var i = 0; i < widget.item.options!.length; i++) {
          if (itemCount.value[i] == 1) {
            optionsIds += "${widget.item.options![i].id},";
          }
        }
        if (optionsIds.isNotEmpty)
          optionsIds = optionsIds.substring(0, optionsIds.length - 1);
        await api().post('add_to_cart', data: {
          "token": user.value?.token,
          "user_id": user.value?.id,
          "option_ids": optionsIds,
          "quantity": count.value,
          "item_id": widget.item.id,
          "comment": comment.value,
          "is_update": widget.isEdit! ? "true" : "false",
          "cart_id": widget.isEdit! ? widget.item.cartId : "",
          "calculate_amount":
              "${((double.parse("0${widget.item.itemPrice}") * double.parse(count.value.toString())) + List.generate(itemCount.value.length, (i) => double.parse("0${widget.item.options![i].price}") * itemCount.value[i]).fold(0, (previousValue, element) => previousValue + element)).toStringAsFixed(2)}"
        });
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
        widget.addToCart(
            double.parse("0${widget.item.itemPrice!}") +
                List.generate(
                    itemCount.value.length,
                    (i) =>
                        double.parse("0${widget.item.options![i].price}") *
                        itemCount.value[i]).fold(
                    0, (previousValue, element) => previousValue + element),
            count.value);
        // debugPrint('${resp.data}');
        loading.value = false;
      } catch (e) {
        loading.value = false;
        // showError(context, e);
        debugPrint("${(e as DioError).response}");
      }
    }

    void addComment() async {
      loading.value = true;
      try {
        await api().post('add_comment_to_cart', data: {
          "token": user.value?.token,
          "user_id": user.value?.id,
          "comment": comment.value,
          "cart_id": widget.item.id
        });
        // ignore: use_build_context_synchronously
        // Navigator.of(context).pop();
        loading.value = false;
      } catch (e) {
        loading.value = false;
        //showError(context, e);
        debugPrint("${(e as DioError).response}");
      }
    }

    // debugPrint("${widget.item.options}");
    return Dialog(
      backgroundColor: CC.white,
      insetPadding: EdgeInsets.symmetric(
          horizontal: (30 / 4.75).w, vertical: (30 / 4.75).w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                        iconSize: 24.sp),
                  ],
                ),
                Row(
                  children: [
                    sbw((30 / 3.75).w),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.sp),
                      child: CachedNetworkImage(
                        height: (75 / 3.75).w,
                        width: (75 / 3.75).w,
                        imageUrl:
                            'https://orkiosk.com/admin/uploads/images/${widget.item.image}',
                        placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                          color: CC.transparent,
                          strokeWidth: 2,
                        )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    sbw((20 / 3.75).w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.item.itemName!,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: CC.black)),
                          Text(
                            "\$${((double.parse("0${widget.item.itemPrice!}") * double.parse(count.value.toString())) + List.generate(itemCount.value.length, (i) => double.parse("0${widget.item.options![i].price}") * itemCount.value[i]).fold(0, (previousValue, element) => previousValue + element)).toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: CC.themePurple),
                          ),
                          Text(widget.item.itemDescription!,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: CC.gray3)),
                        ],
                      ),
                    ),
                    sbw((30 / 3.75).w),
                  ],
                ),
                sbh((30 / 3.75).w),
                Row(
                  children: [
                    sbw((30 / 3.75).w),
                    Container(
                      decoration: BoxDecoration(
                        color: CC.white,
                        borderRadius: BorderRadius.circular(25),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: CC.themePurple,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            iconSize: (35 / 3.75).w,
                            onPressed: () =>
                                count.value == 1 ? null : count.value--,
                          ),
                          Text('${count.value}'.padLeft(2, '0'),
                              style: TextStyle(fontSize: 18.sp)),
                          IconButton(
                            icon: const Icon(Icons.add),
                            iconSize: (35 / 3.75).w,
                            onPressed: () => count.value++,
                          ),
                        ],
                      ),
                    ),
                    sbw((30 / 3.75).w),
                    Expanded(
                      child: AppButton(
                        onTap: () {
                          addToCart();

                          // Get.to(const CheckoutScreen());
                        },
                        text: "Add",
                        padding: EdgeInsets.symmetric(vertical: (18 / 3.75).w),
                        loading: loading.value,
                      ),
                    ),
                    sbw((30 / 3.75).w),
                  ],
                ),
                if (widget.item.options!.length > 0)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (30 / 3.75).w, vertical: 5),
                    child: Text(
                      "Add complement",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                if (widget.item.options!.length > 0) sbh((30 / 3.75).w),
                if (widget.item.options!.length > 0)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30.h,
                    child: ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: widget.item.options!.length,
                        itemBuilder: (BuildContext context, int i) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  sbw((30 / 3.75).w),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: CC.white,
                                      borderRadius: BorderRadius.circular(25),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: CC.themePurple,
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          child: Icon(Icons.remove),
                                          onTap: () {
                                            itemCount.value[i] == 0
                                                ? null
                                                : (itemCount.value[i] =
                                                    itemCount.value[i] - 1);
                                            itemCount.notifyListeners();
                                          },
                                        ),
                                        sbw((10 / 3.75).w),
                                        Text(
                                            '${itemCount.value[i]}'
                                                .padLeft(2, '0'),
                                            style: TextStyle(fontSize: 15.sp)),
                                        sbw((10 / 3.75).w),
                                        InkWell(
                                          child: Icon(Icons.add),
                                          onTap: () {
                                            if (itemCount.value[i] < 1) {
                                              (itemCount.value[i] =
                                                  itemCount.value[i] + 1);
                                              itemCount.notifyListeners();
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  sbw((30 / 3.75).w),
                                  Text(
                                    "${widget.item.options![i].name} (\$${widget.item.options![i].price})",
                                    style: TextStyle(fontSize: 3.3.w),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                  sbw((30 / 3.75).w),
                                ],
                              ),
                              sbh((10 / 3.75).w),
                            ],
                          );
                        }),
                  ),
                sbh(20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppTextFormField(
                    // controller: comment.value as TextEditingController,
                    floatingLabel: commentLabel.value == ''
                        ? 'Special '
                            'Instruction'
                        : commentLabel.value,
                    maxLines: 5,
                    validator: (text) =>
                        text?.isNotEmpty == true ? null : "Required",
                    onChanged: (text) {
                      print("text--------${text}");
                      comment.value = text ?? "";
                      commentLabel.value = 'Special '
                          'Instruction';
                    },
                    // onTap: ,
                  ),
                ),
                sbh((30 / 3.75).w),
              ],
            ),
          ],
        ),
      ),
    );
  }
} /**/
