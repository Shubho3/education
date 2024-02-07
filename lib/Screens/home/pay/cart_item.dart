import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'item_item.dart';

class CartItem {
  final String id;
  final String category_id;
  final String item_name;
  final String item_price;
  final String item_description;
  final String image;
  final String date_time;
  final String status;
  final String comment;
  final List<OptionItem> options;
  String quantity;
  final String item_id;
  final String option_ids;
  final String cart_id;
  final String calculate_amount;
  CartItem({
    required this.id,
    required this.category_id,
    required this.item_name,
    required this.item_price,
    required this.item_description,
    required this.image,
    required this.date_time,
    required this.status,
    required this.options,
    required this.quantity,
    required this.item_id,
    required this.option_ids,
    required this.cart_id,
    required this.comment,
    required this.calculate_amount,

  });

  CartItem copyWith({
    String? id,
    String? category_id,
    String? item_name,
    String? item_price,
    String? item_description,
    String? image,
    String? date_time,
    String? status,
    List<OptionItem>? options,
    String? quantity,
    String? item_id,
    String? option_ids,
    String? cart_id,
    String? comment,
    String? calculate_amount,
  }) {
    return CartItem(
      id: id ?? this.id,
      category_id: category_id ?? this.category_id,
      item_name: item_name ?? this.item_name,
      item_price: item_price ?? this.item_price,
      item_description: item_description ?? this.item_description,
      image: image ?? this.image,
      date_time: date_time ?? this.date_time,
      status: status ?? this.status,
      options: options ?? this.options,
      quantity: quantity ?? this.quantity,
      item_id: item_id ?? this.item_id,
      option_ids: option_ids ?? this.option_ids,
      cart_id: cart_id ?? this.cart_id,
      comment: comment ?? this.comment,
      calculate_amount: calculate_amount ?? this.calculate_amount,
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
      'options': options.map((x) => x.toMap()).toList(),
      'quantity': quantity,
      'item_id': item_id,
      'option_ids': option_ids,
      'cart_id': cart_id,
      'comment': comment,
      'calculate_amount': calculate_amount,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'] ?? '',
      category_id: map['category_id'] ?? '',
      item_name: map['item_name'] ?? '',
      item_price: map['item_price'] ?? '',
      item_description: map['item_description'] ?? '',
      image: map['image'] ?? '',
      date_time: map['date_time'] ?? '',
      status: map['status'] ?? '',
      options: List<OptionItem>.from(map['options']?.map((x) => OptionItem.fromMap(x))),
      quantity: map['quantity'] ?? '',
      item_id: map['item_id'] ?? '',
      option_ids: map['option_ids'] ?? '',
      cart_id: map['cart_id'] ?? '',
      comment: map['comment'] ?? '',
      calculate_amount: map['calculate_amount'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) => CartItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartItem(id: $id, category_id: $category_id, item_name: $item_name, '
        'item_price: $item_price, item_description: $item_description, image: $image, date_time: $date_time,'
        ' status: $status, options: $options, quantity: $quantity, item_id: '
        '$item_id, option_ids: $option_ids, cart_id: $cart_id , comment:$comment, calculate_amount:$calculate_amount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItem &&
        other.id == id &&
        other.category_id == category_id &&
        other.item_name == item_name &&
        other.item_price == item_price &&
        other.item_description == item_description &&
        other.image == image &&
        other.date_time == date_time &&
        other.status == status &&
        listEquals(other.options, options) &&
        other.quantity == quantity &&
        other.item_id == item_id &&
        other.option_ids == option_ids &&
        other.comment == comment &&
        other.calculate_amount == calculate_amount &&
        other.cart_id == cart_id;
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
        options.hashCode ^
        quantity.hashCode ^
        item_id.hashCode ^
        option_ids.hashCode ^
        comment.hashCode ^
    calculate_amount.hashCode ^
        cart_id.hashCode;
  }
}
