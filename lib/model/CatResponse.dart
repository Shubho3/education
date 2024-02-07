
class CatResponse {
  CatResponse({
      List<Result>? result, 
      String? message, 
      String? status,}){
    _result = result;
    _message = message;
    _status = status;
}

  CatResponse.fromJson(dynamic json) {
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
CatResponse copyWith({  List<Result>? result,
  String? message,
  String? status,
}) => CatResponse(  result: result ?? _result,
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

class Result {
  Result({
      String? id, 
      String? categoryName, 
      String? image, 
      String? status, 
      String? dateTime, 
      String? positionOrder, 
      String? deletedAt, 
      String? adminId,}){
    _id = id;
    _categoryName = categoryName;
    _image = image;
    _status = status;
    _dateTime = dateTime;
    _positionOrder = positionOrder;
    _deletedAt = deletedAt;
    _adminId = adminId;
}

  Result.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['category_name'];
    _image = json['image'];
    _status = json['status'];
    _dateTime = json['date_time'];
    _positionOrder = json['position_order'];
    _deletedAt = json['deleted_at'];
    _adminId = json['admin_id'];
  }
  String? _id;
  String? _categoryName;
  String? _image;
  String? _status;
  String? _dateTime;
  String? _positionOrder;
  String? _deletedAt;
  String? _adminId;
Result copyWith({  String? id,
  String? categoryName,
  String? image,
  String? status,
  String? dateTime,
  String? positionOrder,
  String? deletedAt,
  String? adminId,
}) => Result(  id: id ?? _id,
  categoryName: categoryName ?? _categoryName,
  image: image ?? _image,
  status: status ?? _status,
  dateTime: dateTime ?? _dateTime,
  positionOrder: positionOrder ?? _positionOrder,
  deletedAt: deletedAt ?? _deletedAt,
  adminId: adminId ?? _adminId,
);
  String? get id => _id;
  String? get categoryName => _categoryName;
  String? get image => _image;
  String? get status => _status;
  String? get dateTime => _dateTime;
  String? get positionOrder => _positionOrder;
  String? get deletedAt => _deletedAt;
  String? get adminId => _adminId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_name'] = _categoryName;
    map['image'] = _image;
    map['status'] = _status;
    map['date_time'] = _dateTime;
    map['position_order'] = _positionOrder;
    map['deleted_at'] = _deletedAt;
    map['admin_id'] = _adminId;
    return map;
  }

}
