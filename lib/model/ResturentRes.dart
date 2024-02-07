/// result : [{"id":"16","name":"Sub admin 1","email":"subadmin1@gmail.com","password":"123456","image":"restaurantCat_img_61947.png","type":"SUBADMIN","mobile":"1234567890","address":"","status":"Active","amount":"0","date_time":"2023-12-22 03:56:35"},{"id":"10","name":"Sub Admin","email":"subadmin@gmail.com","password":"123456","image":"restaurantCat_img_93390.png","type":"SUBADMIN","mobile":"1234567890","address":"","status":"Active","amount":"0","date_time":"2023-12-22 01:55:10"},{"id":"17","name":"Jose","email":"jose@gmail.com","password":"123456","image":"restaurantCat_img_73661.png","type":"SUBADMIN","mobile":"123456","address":"","status":"Active","amount":"0","date_time":"2023-12-22 06:21:17"},{"id":"19","name":"test","email":"test@gmail.com","password":"123456","image":"restaurantCat_img_69494.png","type":"SUBADMIN","mobile":"1234567890","address":"","status":"Active","amount":"0","date_time":"2023-12-23 02:35:18"}]
/// message : "successfull"
/// status : "1"

class ResturentRes {
  ResturentRes({
    List<Result>? result,
    String? message,
    String? status,
  }) {
    _result = result;
    _message = message;
    _status = status;
  }

  ResturentRes.fromJson(dynamic json) {
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
    _message = json['message'];
    _status = json['status'];
  }
  List<Result>? _result;
  String? _message;
  String? _status;
  ResturentRes copyWith({
    List<Result>? result,
    String? message,
    String? status,
  }) =>
      ResturentRes(
        result: result ?? _result,
        message: message ?? _message,
        status: status ?? _status,
      );
  List<Result>? get result => _result;
  String? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }
}

/// id : "16"
/// name : "Sub admin 1"
/// email : "subadmin1@gmail.com"
/// password : "123456"
/// image : "restaurantCat_img_61947.png"
/// type : "SUBADMIN"
/// mobile : "1234567890"
/// address : ""
/// status : "Active"
/// amount : "0"
/// date_time : "2023-12-22 03:56:35"

class Result {
  Result({
    String? id,
    String? name,
    String? email,
    String? password,
    String? image,
    String? type,
    String? mobile,
    String? address,
    String? status,
    String? amount,
    String? rest_name,
    String? dateTime,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _password = password;
    _image = image;
    _type = type;
    _mobile = mobile;
    _address = address;
    _rest_name = rest_name;
    _status = status;
    _amount = amount;
    _dateTime = dateTime;
  }

  Result.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _image = json['image'];
    _type = json['type'];
    _mobile = json['mobile'];
    _address = json['address'];
    _status = json['status'];
    _amount = json['amount'];
    _dateTime = json['date_time'];
    _rest_name = json['rest_name'];
  }
  String? _id;
  String? _name;
  String? _email;
  String? _password;
  String? _image;
  String? _type;
  String? _mobile;
  String? _address;
  String? _status;
  String? _amount;
  String? _dateTime;
  String? _rest_name;
  Result copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? image,
    String? type,
    String? mobile,
    String? address,
    String? status,
    String? rest_name,
    String? amount,
    String? dateTime,
  }) =>
      Result(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        password: password ?? _password,
        image: image ?? _image,
        type: type ?? _type,
        mobile: mobile ?? _mobile,
        address: address ?? _address,
        status: status ?? _status,
        amount: amount ?? _amount,
        dateTime: dateTime ?? _dateTime,
        rest_name: rest_name ?? _rest_name,
      );
  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get image => _image;
  String? get type => _type;
  String? get mobile => _mobile;
  String? get address => _address;
  String? get status => _status;
  String? get amount => _amount;
  String? get dateTime => _dateTime;
  String? get rest_name => _rest_name;
  String userAsString() {
    return ' ${this.rest_name}';
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return rest_name.toString().contains(filter);
  }

  bool isEqual(Result model) {
    return this.name == model.name;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['image'] = _image;
    map['type'] = _type;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['status'] = _status;
    map['amount'] = _amount;
    map['date_time'] = _dateTime;
    map['rest_name'] = _rest_name;
    return map;
  }
}
