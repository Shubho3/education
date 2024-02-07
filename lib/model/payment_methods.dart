import 'dart:convert';

class PaymentMethodModel {
  final String id;
  final String name;
  final String status;
  final String date_time;
  PaymentMethodModel({
    required this.id,
    required this.name,
    required this.status,
    required this.date_time,
  });

  PaymentMethodModel copyWith({
    String? id,
    String? name,
    String? status,
    String? date_time,
  }) {
    return PaymentMethodModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      date_time: date_time ?? this.date_time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'date_time': date_time,
    };
  }

  factory PaymentMethodModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      date_time: map['date_time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethodModel.fromJson(String source) => PaymentMethodModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaymentMethod(id: $id, name: $name, status: $status, date_time: $date_time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentMethodModel && other.id == id && other.name == name && other.status == status && other.date_time == date_time;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ status.hashCode ^ date_time.hashCode;
  }
}
