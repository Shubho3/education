import 'dart:convert';

ProfileRes profileResFromJson(String str) =>
    ProfileRes.fromJson(json.decode(str));

String profileResToJson(ProfileRes data) => json.encode(data.toJson());

class ProfileRes {
  ProfileRes({
    String? message,
    String? status,
    ClientData? clientData,
  }) {
    _message = message;
    _status = status;
    _clientData = clientData;
  }

  ProfileRes.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _clientData = json['client_data'] != null
        ? ClientData.fromJson(json['client_data'])
        : null;
  }

  String? _message;
  String? _status;
  ClientData? _clientData;

  ProfileRes copyWith({
    String? message,
    String? status,
    ClientData? clientData,

  }) =>
      ProfileRes(
        message: message ?? _message,
        status: status ?? _status,
        clientData: clientData ?? _clientData,
      );

  String? get message => _message;

  String? get status => _status;

  ClientData? get clientData => _clientData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_clientData != null) {
      map['client_data'] = _clientData?.toJson();
    }
    return map;
  }
}

ClientData clientDataFromJson(String str) =>
    ClientData.fromJson(json.decode(str));

String clientDataToJson(ClientData data) => json.encode(data.toJson());

class ClientData {
  ClientData({
    String? id,
    String? companyName,
    String? contactName,
    String? phone,
    String? email,
    String? address,
    String? sunbizDocNumber,
    String? ein,
    String? logo,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _companyName = companyName;
    _contactName = contactName;
    _phone = phone;
    _email = email;
    _address = address;
    _sunbizDocNumber = sunbizDocNumber;
    _ein = ein;
    _logo = logo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ClientData.fromJson(dynamic json) {
    _id = json['id'];
    _companyName = json['company_name'];
    _contactName = json['contact_name'];
    _phone = json['phone'];
    _email = json['email'];
    _address = json['address'];
    _sunbizDocNumber = json['sunbiz_doc_number'];
    _ein = json['ein'];
    _logo = json['logo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  String? _id;
  String? _companyName;
  String? _contactName;
  String? _phone;
  String? _email;
  String? _address;
  String? _sunbizDocNumber;
  String? _ein;
  String? _logo;
  String? _createdAt;
  String? _updatedAt;

  ClientData copyWith({
    String? id,
    String? companyName,
    String? contactName,
    String? phone,
    String? email,
    String? address,
    String? sunbizDocNumber,
    String? ein,
    String? logo,
    String? createdAt,
    String? updatedAt,
  }) =>
      ClientData(
        id: id ?? _id,
        companyName: companyName ?? _companyName,
        contactName: contactName ?? _contactName,
        phone: phone ?? _phone,
        email: email ?? _email,
        address: address ?? _address,
        sunbizDocNumber: sunbizDocNumber ?? _sunbizDocNumber,
        ein: ein ?? _ein,
        logo: logo ?? _logo,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  String? get id => _id;

  String? get companyName => _companyName;

  String? get contactName => _contactName;

  String? get phone => _phone;

  String? get email => _email;

  String? get address => _address;

  String? get sunbizDocNumber => _sunbizDocNumber;

  String? get ein => _ein;

  String? get logo => _logo;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['company_name'] = _companyName;
    map['contact_name'] = _contactName;
    map['phone'] = _phone;
    map['email'] = _email;
    map['address'] = _address;
    map['sunbiz_doc_number'] = _sunbizDocNumber;
    map['ein'] = _ein;
    map['logo'] = _logo;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
