/// result : [{"id":"2","name":"test","description":"test","image":"https://www.orkiosk.com/admin//uploads/images/restaurantCat_img_80616.png","date_time":"2024-01-30 03:51:53","admin_id":"10"}]
/// message : "successfull"
/// status : "1"

class PublicationModel {
  PublicationModel({
      List<Result>? result, 
      String? message, 
      String? status,}){
    _result = result;
    _message = message;
    _status = status;
}

  PublicationModel.fromJson(dynamic json) {
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
PublicationModel copyWith({  List<Result>? result,
  String? message,
  String? status,
}) => PublicationModel(  result: result ?? _result,
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

/// id : "2"
/// name : "test"
/// description : "test"
/// image : "https://www.orkiosk.com/admin//uploads/images/restaurantCat_img_80616.png"
/// date_time : "2024-01-30 03:51:53"
/// admin_id : "10"

class Result {
  Result({
      String? id, 
      String? name, 
      String? description, 
      String? image, 
      String? dateTime, 
      String? adminId,}){
    _id = id;
    _name = name;
    _description = description;
    _image = image;
    _dateTime = dateTime;
    _adminId = adminId;
}

  Result.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _dateTime = json['date_time'];
    _adminId = json['admin_id'];
  }
  String? _id;
  String? _name;
  String? _description;
  String? _image;
  String? _dateTime;
  String? _adminId;
Result copyWith({  String? id,
  String? name,
  String? description,
  String? image,
  String? dateTime,
  String? adminId,
}) => Result(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  image: image ?? _image,
  dateTime: dateTime ?? _dateTime,
  adminId: adminId ?? _adminId,
);
  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get image => _image;
  String? get dateTime => _dateTime;
  String? get adminId => _adminId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    map['date_time'] = _dateTime;
    map['admin_id'] = _adminId;
    return map;
  }

}