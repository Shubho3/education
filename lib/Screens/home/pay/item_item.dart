import 'dart:convert';

import 'package:flutter/foundation.dart';

class ItemItem {
  final String id;
  final String category_id;
  final String item_name;
  final String item_price;
  final String item_description;
  final String image;
  final String date_time;
  final String status;
  final String category_name;
  final List<OptionItem> options;
  ItemItem({
    required this.id,
    required this.category_id,
    required this.item_name,
    required this.item_price,
    required this.item_description,
    required this.image,
    required this.date_time,
    required this.status,
    required this.category_name,
    required this.options,
  });

  ItemItem copyWith({
    String? id,
    String? category_id,
    String? item_name,
    String? item_price,
    String? item_description,
    String? image,
    String? date_time,
    String? status,
    String? category_name,
    List<OptionItem>? options,
  }) {
    return ItemItem(
      id: id ?? this.id,
      category_id: category_id ?? this.category_id,
      item_name: item_name ?? this.item_name,
      item_price: item_price ?? this.item_price,
      item_description: item_description ?? this.item_description,
      image: image ?? this.image,
      date_time: date_time ?? this.date_time,
      status: status ?? this.status,
      category_name: category_name ?? this.category_name,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_id': category_id,
      'item_name': item_name,
      'item_price': item_price,
      'item_description': item_description,
      'image': image,
      'date_time': date_time,
      'status': status,
      'category_name': category_name,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory ItemItem.fromMap(Map<String, dynamic> map) {
    return ItemItem(
      id: map['id'] ?? '',
      category_id: map['category_id'] ?? '',
      item_name: map['item_name'] ?? '',
      item_price: map['item_price'] ?? '',
      item_description: map['item_description'] ?? '',
      image: map['image'] ?? '',
      date_time: map['date_time'] ?? '',
      status: map['status'] ?? '',
      category_name: map['category_name'] ?? '',
      options: List<OptionItem>.from(map['options']?.map((x) => OptionItem.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemItem.fromJson(String source) => ItemItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemItem(id: $id, category_id: $category_id, item_name: $item_name, item_price: $item_price, item_description: $item_description, image: $image, date_time: $date_time, status: $status, category_name: $category_name, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemItem &&
        other.id == id &&
        other.category_id == category_id &&
        other.item_name == item_name &&
        other.item_price == item_price &&
        other.item_description == item_description &&
        other.image == image &&
        other.date_time == date_time &&
        other.status == status &&
        other.category_name == category_name &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category_id.hashCode ^
        item_name.hashCode ^
        item_price.hashCode ^
        item_description.hashCode ^
        image.hashCode ^
        date_time.hashCode ^
        status.hashCode ^
        category_name.hashCode ^
        options.hashCode;
  }
}

class OptionItem {
  final String id;
  final String item_id;
  final String name;
  final String price;
  final String image;
  final String date_time;
  final String status;
  final String statusType;
  OptionItem({
    required this.id,
    required this.item_id,
    required this.name,
    required this.price,
    required this.image,
    required this.date_time,
    required this.status,
    required this.statusType,
  });

  OptionItem copyWith({
    String? id,
    String? item_id,
    String? name,
    String? price,
    String? image,
    String? date_time,
    String? status,
    String? statusType,
  }) {
    return OptionItem(
      id: id ?? this.id,
      item_id: item_id ?? this.item_id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      date_time: date_time ?? this.date_time,
      status: status ?? this.status,
      statusType: status ?? this.statusType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item_id': item_id,
      'name': name,
      'price': price,
      'image': image,
      'date_time': date_time,
      'status': status,
      'statusType': statusType,
    };
  }

  factory OptionItem.fromMap(Map<String, dynamic> map) {
    return OptionItem(
      id: map['id'] ?? '',
      item_id: map['item_id'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      image: map['image'] ?? '',
      date_time: map['date_time'] ?? '',
      status: map['status'] ?? '',
      statusType: map['status_type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OptionItem.fromJson(String source) => OptionItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Option(id: $id, item_id: $item_id, name: $name, price: $price, image: $image, date_time: $date_time, status: $status, status_type: $statusType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OptionItem &&
        other.id == id &&
        other.item_id == item_id &&
        other.name == name &&
        other.price == price &&
        other.image == image &&
        other.date_time == date_time &&
        other.status == status && other.statusType==statusType;
  }

  @override
  int get hashCode {
    return id.hashCode ^ item_id.hashCode ^ name.hashCode ^ price.hashCode ^
    image.hashCode ^ date_time.hashCode ^ status.hashCode ^statusType.hashCode;
  }
}
