/// product : [{"id":"70","category_id":"51","item_name":"Old Monk","item_price":".99","item_description":"Old Monk","image":"https://www.orkiosk.com/admin//uploads/images/restaurantCat_img_14441.png","date_time":"2023-12-23 02:37:37","status":"Active","position_order":"0","notes":"Old Monk Rum is an iconic vatted Indian dark rum, launched in 1954. It is a dark rum with a distinct vanilla flavour, with an alcohol content of 42.8%.\r\n₹75.00 to ₹720.00 · ‎ In stock","item_count":"0","deleted_at":"Runinig","tax_status":"Yes","admin_id":"19","category_name":"Rum","options":[{"id":"104","item_id":"70","name":"  Chakna ","price":".02","image":"","date_time":"2023-12-23 02:37:37","status":"Active","position_order":"0","quantity":0,"deleted_at":"Runinig"}]}]
/// message : "successfull"
/// status : "1"

class ItemRes {
  ItemRes({
      List<Product>? product, 
      String? message, 
      String? status,}){
    _product = product;
    _message = message;
    _status = status;
}

  ItemRes.fromJson(dynamic json) {
    if (json['result'] != null) {
      _product = [];
      json['result'].forEach((v) {
        _product?.add(Product.fromJson(v));
      });
    }
    _message = json['message'];
    _status = json['status'];
  }
  List<Product>? _product;
  String? _message;
  String? _status;
ItemRes copyWith({  List<Product>? product,
  String? message,
  String? status,
}) => ItemRes(  product: product ?? _product,
  message: message ?? _message,
  status: status ?? _status,
);
  List<Product>? get product => _product;
  String? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_product != null) {
      map['product'] = _product?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}
class Product {
  Product({
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
      String? favorite_item_status,
      String? categoryName,
      String? quantity_status,
      String? item_quantity,
      List<Options>? options,}){
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
    _favorite_item_status = favorite_item_status;
    _categoryName = categoryName;
    _options = options;
    _item_quantity = item_quantity;
    _quantity_status = quantity_status;
}

  Product.fromJson(dynamic json) {
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
    _favorite_item_status = json['favorite_item_status'];
    _categoryName = json['category_name'];
    _item_quantity = json['item_quantity'];
    _quantity_status = json['quantity_status'];
    if (json['options'] != null) {
      _options = [];
      json['options'].forEach((v) {
        _options?.add(Options.fromJson(v));
      });
    }
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
  String? _favorite_item_status;
  String? _categoryName;
  String? _item_quantity;
  String? _quantity_status;
  List<Options>? _options;
Product copyWith({  String? id,
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
  String? favorite_item_status,
  String? categoryName,
  String? item_quantity,
  String? quantity_status,
  List<Options>? options,
}) => Product(  id: id ?? _id,
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
  favorite_item_status: favorite_item_status ?? _favorite_item_status,
  categoryName: categoryName ?? _categoryName,
  options: options ?? _options,
  item_quantity: item_quantity ?? _item_quantity,
  quantity_status: quantity_status ?? _quantity_status,
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
  String? get favorite_item_status => _favorite_item_status!;
  String? get categoryName => _categoryName;
  String? get quantity_status => _quantity_status;
  String? get item_quantity => _item_quantity;
  List<Options>? get options => _options;

  set favorite_item_status(String? value) {
    _favorite_item_status = value;
  }

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
    map['favorite_item_status'] = _favorite_item_status;
    map['category_name'] = _categoryName;
    map['quantity_status'] = _quantity_status;
    map['item_quantity'] = _item_quantity;
    if (_options != null) {
      map['options'] = _options?.map((v) => v.toJson()).toList();
    }
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
/// quantity : 0
/// deleted_at : "Runinig"

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
      int? quantity,
      String? deletedAt,}){
    _id = id;
    _itemId = itemId;
    _name = name;
    _price = price;
    _image = image;
    _dateTime = dateTime;
    _status = status;
    _positionOrder = positionOrder;
    _quantity = quantity;
    _deletedAt = deletedAt;
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
    _quantity = 0;
    _deletedAt = json['deleted_at'];
  }
  String? _id;
  String? _itemId;
  String? _name;
  String? _price;
  String? _image;
  String? _dateTime;
  String? _status;
  String? _positionOrder;
  int? _quantity;
  String? _deletedAt;
Options copyWith({  String? id,
  String? itemId,
  String? name,
  String? price,
  String? image,
  String? dateTime,
  String? status,
  String? positionOrder,
  int? quantity,
  String? deletedAt,
}) => Options(  id: id ?? _id,
  itemId: itemId ?? _itemId,
  name: name ?? _name,
  price: price ?? _price,
  image: image ?? _image,
  dateTime: dateTime ?? _dateTime,
  status: status ?? _status,
  positionOrder: positionOrder ?? _positionOrder,
  quantity: quantity ?? _quantity,
  deletedAt: deletedAt ?? _deletedAt,
);
  String? get id => _id;
  String? get itemId => _itemId;
  String? get name => _name;
  String? get price => _price;
  String? get image => _image;
  String? get dateTime => _dateTime;
  String? get status => _status;
  String? get positionOrder => _positionOrder;
  int? get quantity => _quantity;
  String? get deletedAt => _deletedAt;

  set setQuantity(int name) {
    _quantity = name;
  }
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
    map['quantity'] = _quantity;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}
