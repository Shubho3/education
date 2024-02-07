/// result : [{"id":"70","category_id":"51","item_name":"Old Monk","item_price":".99","item_description":"Old Monk","image":"restaurantCat_img_14441.png","date_time":"2023-12-23 02:37:37","status":"Active","position_order":"0","notes":"Old Monk Rum is an iconic vatted Indian dark rum, launched in 1954. It is a dark rum with a distinct vanilla flavour, with an alcohol content of 42.8%.\r\n₹75.00 to ₹720.00 · ‎ In stock","item_count":"142","deleted_at":"Runinig","tax_status":"Yes","admin_id":"19","quantity_status":"Yes","item_quantity":"9","options":[{"id":"104","item_id":"70","name":"  Chakna ","price":".02","image":"","date_time":"2023-12-23 02:37:37","status":"Active","position_order":"0","deleted_at":"Runinig","status_type":"true"},{"id":"119","item_id":"70","name":"chakna green","price":".05","image":"","date_time":"2024-01-06 02:39:48","status":"Active","position_order":"0","deleted_at":"Runinig","status_type":"true"}],"calculate_amount":"1.01","comment":"comment","quantity":"1","item_id":"70","option_ids":"104,119","cart_id":"2043"}]
/// message : "successfull"
/// status : "1"
/// total_amount : "1.06"
/// tax_amount : "0.02"
/// restaurant_name : "Coffee Shop"
/// restaurant_address : "Calle Muñoz Rivera"
/// state_tax_amount : "0.11"

class CartRes {
  CartRes({
      List<Result>? result, 
      String? message, 
      String? status, 
      String? totalAmount, 
      String? taxAmount, 
      String? restaurantName, 
      String? restaurantAddress, 
      String? stateTaxAmount,}){
    _result = result;
    _message = message;
    _status = status;
    _totalAmount = totalAmount;
    _taxAmount = taxAmount;
    _restaurantName = restaurantName;
    _restaurantAddress = restaurantAddress;
    _stateTaxAmount = stateTaxAmount;
}

  CartRes.fromJson(dynamic json) {
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
    _message = json['message'];
    _status = json['status'];
    _totalAmount = json['total_amount'];
    _taxAmount = json['tax_amount'];
    _restaurantName = json['restaurant_name'];
    _restaurantAddress = json['restaurant_address'];
    _stateTaxAmount = json['state_tax_amount'];
  }
  List<Result>? _result;
  String? _message;
  String? _status;
  String? _totalAmount;
  String? _taxAmount;
  String? _restaurantName;
  String? _restaurantAddress;
  String? _stateTaxAmount;
CartRes copyWith({  List<Result>? result,
  String? message,
  String? status,
  String? totalAmount,
  String? taxAmount,
  String? restaurantName,
  String? restaurantAddress,
  String? stateTaxAmount,
}) => CartRes(  result: result ?? _result,
  message: message ?? _message,
  status: status ?? _status,
  totalAmount: totalAmount ?? _totalAmount,
  taxAmount: taxAmount ?? _taxAmount,
  restaurantName: restaurantName ?? _restaurantName,
  restaurantAddress: restaurantAddress ?? _restaurantAddress,
  stateTaxAmount: stateTaxAmount ?? _stateTaxAmount,
);
  List<Result>? get result => _result;
  String? get message => _message;
  String? get status => _status;
  String? get totalAmount => _totalAmount;
  String? get taxAmount => _taxAmount;
  String? get restaurantName => _restaurantName;
  String? get restaurantAddress => _restaurantAddress;
  String? get stateTaxAmount => _stateTaxAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['status'] = _status;
    map['total_amount'] = _totalAmount;
    map['tax_amount'] = _taxAmount;
    map['restaurant_name'] = _restaurantName;
    map['restaurant_address'] = _restaurantAddress;
    map['state_tax_amount'] = _stateTaxAmount;
    return map;
  }

}

/// id : "70"
/// category_id : "51"
/// item_name : "Old Monk"
/// item_price : ".99"
/// item_description : "Old Monk"
/// image : "restaurantCat_img_14441.png"
/// date_time : "2023-12-23 02:37:37"
/// status : "Active"
/// position_order : "0"
/// notes : "Old Monk Rum is an iconic vatted Indian dark rum, launched in 1954. It is a dark rum with a distinct vanilla flavour, with an alcohol content of 42.8%.\r\n₹75.00 to ₹720.00 · ‎ In stock"
/// item_count : "142"
/// deleted_at : "Runinig"
/// tax_status : "Yes"
/// admin_id : "19"
/// quantity_status : "Yes"
/// item_quantity : "9"
/// options : [{"id":"104","item_id":"70","name":"  Chakna ","price":".02","image":"","date_time":"2023-12-23 02:37:37","status":"Active","position_order":"0","deleted_at":"Runinig","status_type":"true"},{"id":"119","item_id":"70","name":"chakna green","price":".05","image":"","date_time":"2024-01-06 02:39:48","status":"Active","position_order":"0","deleted_at":"Runinig","status_type":"true"}]
/// calculate_amount : "1.01"
/// comment : "comment"
/// quantity : "1"
/// item_id : "70"
/// option_ids : "104,119"
/// cart_id : "2043"

class Result {
  Result({
      String? id, 
      String? categoryId, 
      String? itemName, 
      String? itemPrice, 
      String? itemDescription, 
      String? image, 
      String? dateTime, 
      String? status, 
      String? positionOrder, 
      String? notes, 
      String? itemCount, 
      String? deletedAt, 
      String? taxStatus, 
      String? adminId, 
      String? quantityStatus, 
      String? itemQuantity, 
      List<Options>? options, 
      String? calculateAmount, 
      String? comment, 
      String? quantity, 
      String? itemId, 
      String? optionIds, 
      String? cartId,}){
    _id = id;
    _categoryId = categoryId;
    _itemName = itemName;
    _itemPrice = itemPrice;
    _itemDescription = itemDescription;
    _image = image;
    _dateTime = dateTime;
    _status = status;
    _positionOrder = positionOrder;
    _notes = notes;
    _itemCount = itemCount;
    _deletedAt = deletedAt;
    _taxStatus = taxStatus;
    _adminId = adminId;
    _quantityStatus = quantityStatus;
    _itemQuantity = itemQuantity;
    _options = options;
    _calculateAmount = calculateAmount;
    _comment = comment;
    _quantity = quantity;
    _itemId = itemId;
    _optionIds = optionIds;
    _cartId = cartId;
}

  Result.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _itemName = json['item_name'];
    _itemPrice = json['item_price'];
    _itemDescription = json['item_description'];
    _image = json['image'];
    _dateTime = json['date_time'];
    _status = json['status'];
    _positionOrder = json['position_order'];
    _notes = json['notes'];
    _itemCount = json['item_count'];
    _deletedAt = json['deleted_at'];
    _taxStatus = json['tax_status'];
    _adminId = json['admin_id'];
    _quantityStatus = json['quantity_status'];
    _itemQuantity = json['item_quantity'];
    if (json['options'] != null) {
      _options = [];
      json['options'].forEach((v) {
        _options?.add(Options.fromJson(v));
      });
    }
    _calculateAmount = json['calculate_amount'];
    _comment = json['comment'];
    _quantity = json['quantity'];
    _itemId = json['item_id'];
    _optionIds = json['option_ids'];
    _cartId = json['cart_id'];
  }
  String? _id;
  String? _categoryId;
  String? _itemName;
  String? _itemPrice;
  String? _itemDescription;
  String? _image;
  String? _dateTime;
  String? _status;
  String? _positionOrder;
  String? _notes;
  String? _itemCount;
  String? _deletedAt;
  String? _taxStatus;
  String? _adminId;
  String? _quantityStatus;
  String? _itemQuantity;
  List<Options>? _options;
  String? _calculateAmount;
  String? _comment;
  String? _quantity;
  String? _itemId;
  String? _optionIds;
  String? _cartId;
Result copyWith({  String? id,
  String? categoryId,
  String? itemName,
  String? itemPrice,
  String? itemDescription,
  String? image,
  String? dateTime,
  String? status,
  String? positionOrder,
  String? notes,
  String? itemCount,
  String? deletedAt,
  String? taxStatus,
  String? adminId,
  String? quantityStatus,
  String? itemQuantity,
  List<Options>? options,
  String? calculateAmount,
  String? comment,
  String? quantity,
  String? itemId,
  String? optionIds,
  String? cartId,
}) => Result(  id: id ?? _id,
  categoryId: categoryId ?? _categoryId,
  itemName: itemName ?? _itemName,
  itemPrice: itemPrice ?? _itemPrice,
  itemDescription: itemDescription ?? _itemDescription,
  image: image ?? _image,
  dateTime: dateTime ?? _dateTime,
  status: status ?? _status,
  positionOrder: positionOrder ?? _positionOrder,
  notes: notes ?? _notes,
  itemCount: itemCount ?? _itemCount,
  deletedAt: deletedAt ?? _deletedAt,
  taxStatus: taxStatus ?? _taxStatus,
  adminId: adminId ?? _adminId,
  quantityStatus: quantityStatus ?? _quantityStatus,
  itemQuantity: itemQuantity ?? _itemQuantity,
  options: options ?? _options,
  calculateAmount: calculateAmount ?? _calculateAmount,
  comment: comment ?? _comment,
  quantity: quantity ?? _quantity,
  itemId: itemId ?? _itemId,
  optionIds: optionIds ?? _optionIds,
  cartId: cartId ?? _cartId,
);
  String? get id => _id;
  String? get categoryId => _categoryId;
  String? get itemName => _itemName;
  String? get itemPrice => _itemPrice;
  String? get itemDescription => _itemDescription;
  String? get image => _image;
  String? get dateTime => _dateTime;
  String? get status => _status;
  String? get positionOrder => _positionOrder;
  String? get notes => _notes;
  String? get itemCount => _itemCount;
  String? get deletedAt => _deletedAt;
  String? get taxStatus => _taxStatus;
  String? get adminId => _adminId;
  String? get quantityStatus => _quantityStatus;
  String? get itemQuantity => _itemQuantity;
  List<Options>? get options => _options;
  String? get calculateAmount => _calculateAmount;
  String? get comment => _comment;
  String? get quantity => _quantity;
  String? get itemId => _itemId;
  String? get optionIds => _optionIds;
  String? get cartId => _cartId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['item_name'] = _itemName;
    map['item_price'] = _itemPrice;
    map['item_description'] = _itemDescription;
    map['image'] = _image;
    map['date_time'] = _dateTime;
    map['status'] = _status;
    map['position_order'] = _positionOrder;
    map['notes'] = _notes;
    map['item_count'] = _itemCount;
    map['deleted_at'] = _deletedAt;
    map['tax_status'] = _taxStatus;
    map['admin_id'] = _adminId;
    map['quantity_status'] = _quantityStatus;
    map['item_quantity'] = _itemQuantity;
    if (_options != null) {
      map['options'] = _options?.map((v) => v.toJson()).toList();
    }
    map['calculate_amount'] = _calculateAmount;
    map['comment'] = _comment;
    map['quantity'] = _quantity;
    map['item_id'] = _itemId;
    map['option_ids'] = _optionIds;
    map['cart_id'] = _cartId;
    return map;
  }

}

/// id : "104"
/// item_id : "70"
/// name : "  Chakna "
/// price : ".02"
/// image : ""
/// date_time : "2023-12-23 02:37:37"
/// status : "Active"
/// position_order : "0"
/// deleted_at : "Runinig"
/// status_type : "true"

class Options {
  Options({
      String? id, 
      String? itemId, 
      String? name, 
      String? price, 
      String? image, 
      String? dateTime, 
      String? status, 
      String? positionOrder, 
      String? deletedAt, 
      String? statusType,}){
    _id = id;
    _itemId = itemId;
    _name = name;
    _price = price;
    _image = image;
    _dateTime = dateTime;
    _status = status;
    _positionOrder = positionOrder;
    _deletedAt = deletedAt;
    _statusType = statusType;
}

  Options.fromJson(dynamic json) {
    _id = json['id'];
    _itemId = json['item_id'];
    _name = json['name'];
    _price = json['price'];
    _image = json['image'];
    _dateTime = json['date_time'];
    _status = json['status'];
    _positionOrder = json['position_order'];
    _deletedAt = json['deleted_at'];
    _statusType = json['status_type'];
  }
  String? _id;
  String? _itemId;
  String? _name;
  String? _price;
  String? _image;
  String? _dateTime;
  String? _status;
  String? _positionOrder;
  String? _deletedAt;
  String? _statusType;
Options copyWith({  String? id,
  String? itemId,
  String? name,
  String? price,
  String? image,
  String? dateTime,
  String? status,
  String? positionOrder,
  String? deletedAt,
  String? statusType,
}) => Options(  id: id ?? _id,
  itemId: itemId ?? _itemId,
  name: name ?? _name,
  price: price ?? _price,
  image: image ?? _image,
  dateTime: dateTime ?? _dateTime,
  status: status ?? _status,
  positionOrder: positionOrder ?? _positionOrder,
  deletedAt: deletedAt ?? _deletedAt,
  statusType: statusType ?? _statusType,
);
  String? get id => _id;
  String? get itemId => _itemId;
  String? get name => _name;
  String? get price => _price;
  String? get image => _image;
  String? get dateTime => _dateTime;
  String? get status => _status;
  String? get positionOrder => _positionOrder;
  String? get deletedAt => _deletedAt;
  String? get statusType => _statusType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['item_id'] = _itemId;
    map['name'] = _name;
    map['price'] = _price;
    map['image'] = _image;
    map['date_time'] = _dateTime;
    map['status'] = _status;
    map['position_order'] = _positionOrder;
    map['deleted_at'] = _deletedAt;
    map['status_type'] = _statusType;
    return map;
  }

}