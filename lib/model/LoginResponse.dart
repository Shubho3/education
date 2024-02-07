import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    User? user,
    String? message,
    String? status,
  }) {
    _user = user;
    _message = message;
    _status = status;
  }

  LoginResponse.fromJson(dynamic json) {
    _user = json['result'] != null ? User.fromJson(json['result']) : null;
    _message = json['message'];
    _status = json['status'];
  }
  User? _user;
  String? _message;
  String? _status;
  LoginResponse copyWith({
    User? user,
    String? message,
    String? status,
  }) =>
      LoginResponse(
        user: user ?? _user,
        message: message ?? _message,
        status: status ?? _status,
      );
  User? get user => _user;
  String? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['result'] = _user?.toJson();
    }
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }
}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    String? id,
    String? type,
    String? userName,
    String? mobile,
    String? email,
    String? password,
    String? image,
    String? otp,
    String? status,
    String? lat,
    String? lon,
    String? address,
    String? socialId,
    String? dateTime,
    String? iosRegisterId,
    String? registerId,
    String? onlineStatus,
    String? adminId,
    String? reqDatetime,
    String? expiredAt,
    String? token,
    String? lastLogin,
    String? orderComplete,
    String? admin_id,
  }) {
    _id = id;
    _type = type;
    _userName = userName;
    _mobile = mobile;
    _email = email;
    _password = password;
    _image = image;
    _otp = otp;
    _status = status;
    _lat = lat;
    _lon = lon;
    _address = address;
    _socialId = socialId;
    _dateTime = dateTime;
    _iosRegisterId = iosRegisterId;
    _registerId = registerId;
    _onlineStatus = onlineStatus;
    _adminId = adminId;
    _reqDatetime = reqDatetime;
    _expiredAt = expiredAt;
    _token = token;
    _lastLogin = lastLogin;
    _orderComplete = orderComplete;
    _admin_id = admin_id;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _userName = json['user_name'];
    _mobile = json['mobile'];
    _email = json['email'];
    _password = json['password'];
    _image = json['image'];
    _otp = json['otp'];
    _status = json['status'];
    _lat = json['lat'];
    _lon = json['lon'];
    _address = json['address'];
    _socialId = json['social_id'];
    _dateTime = json['date_time'];
    _iosRegisterId = json['ios_register_id'];
    _registerId = json['register_id'];
    _onlineStatus = json['online_status'];
    _adminId = json['admin_id'];
    _reqDatetime = json['req_datetime'];
    _expiredAt = json['expired_at'];
    _token = json['token'];
    _lastLogin = json['last_login'];
    _admin_id = json['admin_id'];
    _orderComplete = json['order_complete'];
  }
  String? _id;
  String? _type;
  String? _userName;
  String? _mobile;
  String? _email;
  String? _password;
  String? _image;
  String? _otp;
  String? _status;
  String? _lat;
  String? _lon;
  String? _address;
  String? _socialId;
  String? _dateTime;
  String? _iosRegisterId;
  String? _registerId;
  String? _onlineStatus;
  String? _adminId;
  String? _reqDatetime;
  String? _expiredAt;
  String? _token;
  String? _lastLogin;
  String? _orderComplete;
  String? _admin_id;
  User copyWith({
    String? id,
    String? type,
    String? userName,
    String? mobile,
    String? email,
    String? password,
    String? image,
    String? otp,
    String? status,
    String? lat,
    String? lon,
    String? address,
    String? socialId,
    String? dateTime,
    String? iosRegisterId,
    String? registerId,
    String? onlineStatus,
    String? adminId,
    String? reqDatetime,
    String? expiredAt,
    String? token,
    String? lastLogin,
    String? orderComplete,
    String? admin_id,
  }) =>
      User(
        id: id ?? _id,
        type: type ?? _type,
        userName: userName ?? _userName,
        mobile: mobile ?? _mobile,
        email: email ?? _email,
        password: password ?? _password,
        image: image ?? _image,
        otp: otp ?? _otp,
        status: status ?? _status,
        lat: lat ?? _lat,
        lon: lon ?? _lon,
        address: address ?? _address,
        socialId: socialId ?? _socialId,
        dateTime: dateTime ?? _dateTime,
        iosRegisterId: iosRegisterId ?? _iosRegisterId,
        registerId: registerId ?? _registerId,
        onlineStatus: onlineStatus ?? _onlineStatus,
        adminId: adminId ?? _adminId,
        reqDatetime: reqDatetime ?? _reqDatetime,
        expiredAt: expiredAt ?? _expiredAt,
        token: token ?? _token,
        lastLogin: lastLogin ?? _lastLogin,
        orderComplete: orderComplete ?? _orderComplete,
        admin_id: admin_id ?? _admin_id,
      );
  String? get id => _id;
  String? get type => _type;
  String? get userName => _userName;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get password => _password;
  String? get image => _image;
  String? get otp => _otp;
  String? get status => _status;
  String? get lat => _lat;
  String? get lon => _lon;
  String? get address => _address;
  String? get socialId => _socialId;
  String? get dateTime => _dateTime;
  String? get iosRegisterId => _iosRegisterId;
  String? get registerId => _registerId;
  String? get onlineStatus => _onlineStatus;
  String? get adminId => _adminId;
  String? get reqDatetime => _reqDatetime;
  String? get expiredAt => _expiredAt;
  String? get token => _token;
  String? get lastLogin => _lastLogin;
  String? get orderComplete => _orderComplete;
  String? get admin_id => _admin_id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['user_name'] = _userName;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['password'] = _password;
    map['image'] = _image;
    map['otp'] = _otp;
    map['status'] = _status;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['address'] = _address;
    map['social_id'] = _socialId;
    map['date_time'] = _dateTime;
    map['ios_register_id'] = _iosRegisterId;
    map['register_id'] = _registerId;
    map['online_status'] = _onlineStatus;
    map['admin_id'] = _adminId;
    map['req_datetime'] = _reqDatetime;
    map['expired_at'] = _expiredAt;
    map['token'] = _token;
    map['last_login'] = _lastLogin;
    map['order_complete'] = _orderComplete;
    map['admin_id'] = _admin_id;
    return map;
  }
}
