import 'dart:convert';
import 'dart:developer';

/// message : "successfully"
/// status : "1"
/// data : [{"id":"1","user_id":"1","title":"rer","message":"erwr","date_time":"2023-12-15 14:22:38"},{"id":"2","user_id":"1","title":"sdfsf","message":"dsfsfs","date_time":"2023-12-15 14:22:47"},{"id":"3","user_id":"1","title":"sddas","message":"sdsad","date_time":"2023-12-15 14:22:55"}]

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    String? message,
    String? status,
    List<Data>? data,
  }) {
    _message = message;
    _status = status;
    _data = data;
  }

  NotificationModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  String? _message;
  String? _status;
  List<Data>? _data;

  NotificationModel copyWith({
    String? message,
    String? status,
    List<Data>? data,
  }) =>
      NotificationModel(
        message: message ?? _message,
        status: status ?? _status,
        data: data ?? _data,
      );

  String? get message => _message;

  String? get status => _status;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "1"
/// user_id : "1"
/// title : "rer"
/// message : "erwr"
/// date_time : "2023-12-15 14:22:38"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? userId,
    String? title,
    String? message,
    String? type,
    String? dateTime,
  }) {
    _id = id;
    _userId = userId;
    _title = title;
    _message = message;
    _type = type;
    _dateTime = dateTime;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _title = json['title'];
    _message = json['message'];
    _type = json['type'];
    _dateTime = calculateTimeAgo(json['date_time'].toString());
  }

  String? _id;
  String? _userId;
  String? _title;
  String? _message;
  String? _type;
  String? _dateTime;

  Data copyWith({
    String? id,
    String? userId,
    String? title,
    String? type,
    String? message,
    String? dateTime,
  }) =>
      Data(
        id: id ?? _id,
        userId: userId ?? _userId,
        title: title ?? _title,
        type: type ?? _type,
        message: message ?? _message,
        dateTime: dateTime ?? _dateTime,
      );

  String? get id => _id;

  String? get userId => _userId;

  String? get title => _title;

  String? get type => _type;

  String? get message => _message;

  String? get dateTime => _dateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['title'] = _title;
    map['type'] = _type;
    map['message'] = _message;
    map['date_time'] = _dateTime;
    return map;
  }

  String calculateTimeAgo(String yourDate) {
    DateTime eventTime = DateTime.parse(yourDate);
    DateTime currentTime = DateTime.now();

    Duration difference = currentTime.difference(eventTime);

    int minute = 60;
    int hour = 60 * minute;
    int day = 24 * hour;
    int week = 7 * day;
    int month = 30 * day;
    int year = 365 * day;

    if (difference.inSeconds < minute) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inSeconds < hour) {
      return '${(difference.inMinutes / minute).floor()} minutes ago';
    } else if (difference.inSeconds < day) {
      return '${(difference.inHours ).floor()} hours ago';
    } else if (difference.inSeconds < week) {
      return '${(difference.inDays ).floor()} days ago';
    } else if (difference.inSeconds < month) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if (difference.inSeconds < year) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else {
      return '${(difference.inDays / 365).floor()} years ago';
    }
  }
}
