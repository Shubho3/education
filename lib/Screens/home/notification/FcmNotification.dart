/// result : "successful"
/// amount : "13.0"
/// payment_type : "Pay at the Counter"
/// alert : " New order"
/// user_id : "106"
/// order_id : 835
/// key : "New order"

class FcmNotification {
  FcmNotification({
    String? result,
    String? amount,
    String? paymentType,
    String? alert,
    String? userId,
    String? orderId,
    String? key,
  }) {
    _result = result;
    _amount = amount;
    _paymentType = paymentType;
    _alert = alert;
    _userId = userId;
    _orderId = orderId;
    _key = key;
  }

  FcmNotification.fromJson(dynamic json) {
    _result = json['result'];
    _amount = json['amount'];
    _paymentType = json['payment_type'];
    _alert = json['alert'];
    _userId = json['user_id'];
    _orderId = json['order_id'].toString();
    _key = json['key'];
  }
  String? _result;
  String? _amount;
  String? _paymentType;
  String? _alert;
  String? _userId;
  String? _orderId;
  String? _key;
  FcmNotification copyWith({
    String? result,
    String? amount,
    String? paymentType,
    String? alert,
    String? userId,
    String? orderId,
    String? key,
  }) =>
      FcmNotification(
        result: result ?? _result,
        amount: amount ?? _amount,
        paymentType: paymentType ?? _paymentType,
        alert: alert ?? _alert,
        userId: userId ?? _userId,
        orderId: orderId ?? _orderId,
        key: key ?? _key,
      );
  String? get result => _result;
  String? get amount => _amount;
  String? get paymentType => _paymentType;
  String? get alert => _alert;
  String? get userId => _userId;
  String? get orderId => _orderId;
  String? get key => _key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['amount'] = _amount;
    map['payment_type'] = _paymentType;
    map['alert'] = _alert;
    map['user_id'] = _userId;
    map['order_id'] = _orderId;
    map['key'] = _key;
    return map;
  }
}
