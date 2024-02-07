/// result : {"id":"13","name":"orkiosk","logo":"https://www.orkiosk.com/admin/uploads/images/","icon":"https://www.orkiosk.com/admin/uploads/images/","Takeout_button_visible":"true","OnTable_button_visible":"true","Takeout_button_text":"Take out","OnTable_button_text":"From Table","background_display":"https://www.orkiosk.com/admin/uploads/images/","terminal":"sk_test_51N6XeCAjtB1ylsadb4vgG3GnbwBAb1mJjbGMUiusnd5RkViUlhVQhvpiUJ32rOLTNRL4DIBMlqXnfntRqSo8kelX00vcahlx1m","English":"false","French":"false","tip_percentages_amount1":"0","tip_percentages_amount2":"0","tip_percentages_amount3":"0","tip_percentages_amount4":"0","tip_fixed_amount1":"0","tip_fixed_amount2":"0","tip_fixed_amount3":"0","tip_fixed_amount4":"0","smart_tip":"0","menu_bg_color":"#297500","menu_text_color":"#050505","menu_bg_video":"https://www.orkiosk.com/admin/uploads/images/menu_bg_video_20231227053347.mp4","menu_item_text_color":"#ffffff","menu_item_bg_color":"#00612a","menu_order_bg_color":"#ff0000","menu_order_text_color":"#000000","menu_checkout_bg_color":"#ff0000","menu_checkout_text_color":"#000000","state_tax":"0","tax":"","test_stripe_terminal":"sk_test_51N6XeCAjtB1ylsadb4vgG3GnbwBAb1mJjbGMUiusnd5RkViUlhVQhvpiUJ32rOLTNRL4DIBMlqXnfntRqSo8kelX00vcahlx1m","stripe_type":"test","admin_id":"19","restaurant_name":"Theka","restaurant_address":"indore","restaurant_phone_number":"7675756","restaurant_city":"fghh"}
/// message : "successfull"
/// status : "1"

class AppDetails {
  AppDetails({
      Result? result, 
      String? message, 
      String? status,}){
    _result = result;
    _message = message;
    _status = status;
}

  AppDetails.fromJson(dynamic json) {
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _message = json['message'];
    _status = json['status'];
  }
  Result? _result;
  String? _message;
  String? _status;
AppDetails copyWith({  Result? result,
  String? message,
  String? status,
}) => AppDetails(  result: result ?? _result,
  message: message ?? _message,
  status: status ?? _status,
);
  Result? get result => _result;
  String? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}

/// id : "13"
/// name : "orkiosk"
/// logo : "https://www.orkiosk.com/admin/uploads/images/"
/// icon : "https://www.orkiosk.com/admin/uploads/images/"
/// Takeout_button_visible : "true"
/// OnTable_button_visible : "true"
/// Takeout_button_text : "Take out"
/// OnTable_button_text : "From Table"
/// background_display : "https://www.orkiosk.com/admin/uploads/images/"
/// terminal : "sk_test_51N6XeCAjtB1ylsadb4vgG3GnbwBAb1mJjbGMUiusnd5RkViUlhVQhvpiUJ32rOLTNRL4DIBMlqXnfntRqSo8kelX00vcahlx1m"
/// English : "false"
/// French : "false"
/// tip_percentages_amount1 : "0"
/// tip_percentages_amount2 : "0"
/// tip_percentages_amount3 : "0"
/// tip_percentages_amount4 : "0"
/// tip_fixed_amount1 : "0"
/// tip_fixed_amount2 : "0"
/// tip_fixed_amount3 : "0"
/// tip_fixed_amount4 : "0"
/// smart_tip : "0"
/// menu_bg_color : "#297500"
/// menu_text_color : "#050505"
/// menu_bg_video : "https://www.orkiosk.com/admin/uploads/images/menu_bg_video_20231227053347.mp4"
/// menu_item_text_color : "#ffffff"
/// menu_item_bg_color : "#00612a"
/// menu_order_bg_color : "#ff0000"
/// menu_order_text_color : "#000000"
/// menu_checkout_bg_color : "#ff0000"
/// menu_checkout_text_color : "#000000"
/// state_tax : "0"
/// tax : ""
/// test_stripe_terminal : "sk_test_51N6XeCAjtB1ylsadb4vgG3GnbwBAb1mJjbGMUiusnd5RkViUlhVQhvpiUJ32rOLTNRL4DIBMlqXnfntRqSo8kelX00vcahlx1m"
/// stripe_type : "test"
/// admin_id : "19"
/// restaurant_name : "Theka"
/// restaurant_address : "indore"
/// restaurant_phone_number : "7675756"
/// restaurant_city : "fghh"

class Result {
  Result({
      String? id, 
      String? name, 
      String? logo, 
      String? icon, 
      String? takeoutButtonVisible, 
      String? onTableButtonVisible, 
      String? takeoutButtonText, 
      String? onTableButtonText, 
      String? backgroundDisplay, 
      String? terminal, 
      String? english, 
      String? french, 
      String? tipPercentagesAmount1, 
      String? tipPercentagesAmount2, 
      String? tipPercentagesAmount3, 
      String? tipPercentagesAmount4, 
      String? tipFixedAmount1, 
      String? tipFixedAmount2, 
      String? tipFixedAmount3, 
      String? tipFixedAmount4, 
      String? smartTip, 
      String? menuBgColor, 
      String? menuTextColor, 
      String? menuBgVideo, 
      String? menuItemTextColor, 
      String? menuItemBgColor, 
      String? menuOrderBgColor, 
      String? menuOrderTextColor, 
      String? menuCheckoutBgColor, 
      String? menuCheckoutTextColor, 
      String? stateTax, 
      String? tax, 
      String? testStripeTerminal, 
      String? stripeType, 
      String? adminId, 
      String? restaurantName, 
      String? restaurantAddress, 
      String? restaurantPhoneNumber, 
      String? restaurantCity,}){
    _id = id;
    _name = name;
    _logo = logo;
    _icon = icon;
    _takeoutButtonVisible = takeoutButtonVisible;
    _onTableButtonVisible = onTableButtonVisible;
    _takeoutButtonText = takeoutButtonText;
    _onTableButtonText = onTableButtonText;
    _backgroundDisplay = backgroundDisplay;
    _terminal = terminal;
    _english = english;
    _french = french;
    _tipPercentagesAmount1 = tipPercentagesAmount1;
    _tipPercentagesAmount2 = tipPercentagesAmount2;
    _tipPercentagesAmount3 = tipPercentagesAmount3;
    _tipPercentagesAmount4 = tipPercentagesAmount4;
    _tipFixedAmount1 = tipFixedAmount1;
    _tipFixedAmount2 = tipFixedAmount2;
    _tipFixedAmount3 = tipFixedAmount3;
    _tipFixedAmount4 = tipFixedAmount4;
    _smartTip = smartTip;
    _menuBgColor = menuBgColor;
    _menuTextColor = menuTextColor;
    _menuBgVideo = menuBgVideo;
    _menuItemTextColor = menuItemTextColor;
    _menuItemBgColor = menuItemBgColor;
    _menuOrderBgColor = menuOrderBgColor;
    _menuOrderTextColor = menuOrderTextColor;
    _menuCheckoutBgColor = menuCheckoutBgColor;
    _menuCheckoutTextColor = menuCheckoutTextColor;
    _stateTax = stateTax;
    _tax = tax;
    _testStripeTerminal = testStripeTerminal;
    _stripeType = stripeType;
    _adminId = adminId;
    _restaurantName = restaurantName;
    _restaurantAddress = restaurantAddress;
    _restaurantPhoneNumber = restaurantPhoneNumber;
    _restaurantCity = restaurantCity;
}

  Result.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _logo = json['logo'];
    _icon = json['icon'];
    _takeoutButtonVisible = json['Takeout_button_visible'];
    _onTableButtonVisible = json['OnTable_button_visible'];
    _takeoutButtonText = json['Takeout_button_text'];
    _onTableButtonText = json['OnTable_button_text'];
    _backgroundDisplay = json['background_display'];
    _terminal = json['terminal'];
    _english = json['English'];
    _french = json['French'];
    _tipPercentagesAmount1 = json['tip_percentages_amount1'];
    _tipPercentagesAmount2 = json['tip_percentages_amount2'];
    _tipPercentagesAmount3 = json['tip_percentages_amount3'];
    _tipPercentagesAmount4 = json['tip_percentages_amount4'];
    _tipFixedAmount1 = json['tip_fixed_amount1'];
    _tipFixedAmount2 = json['tip_fixed_amount2'];
    _tipFixedAmount3 = json['tip_fixed_amount3'];
    _tipFixedAmount4 = json['tip_fixed_amount4'];
    _smartTip = json['smart_tip'];
    _menuBgColor = json['menu_bg_color'];
    _menuTextColor = json['menu_text_color'];
    _menuBgVideo = json['menu_bg_video'];
    _menuItemTextColor = json['menu_item_text_color'];
    _menuItemBgColor = json['menu_item_bg_color'];
    _menuOrderBgColor = json['menu_order_bg_color'];
    _menuOrderTextColor = json['menu_order_text_color'];
    _menuCheckoutBgColor = json['menu_checkout_bg_color'];
    _menuCheckoutTextColor = json['menu_checkout_text_color'];
    _stateTax = json['state_tax'];
    _tax = json['tax'];
    _testStripeTerminal = json['test_stripe_terminal'];
    _stripeType = json['stripe_type'];
    _adminId = json['admin_id'];
    _restaurantName = json['restaurant_name'];
    _restaurantAddress = json['restaurant_address'];
    _restaurantPhoneNumber = json['restaurant_phone_number'];
    _restaurantCity = json['restaurant_city'];
  }
  String? _id;
  String? _name;
  String? _logo;
  String? _icon;
  String? _takeoutButtonVisible;
  String? _onTableButtonVisible;
  String? _takeoutButtonText;
  String? _onTableButtonText;
  String? _backgroundDisplay;
  String? _terminal;
  String? _english;
  String? _french;
  String? _tipPercentagesAmount1;
  String? _tipPercentagesAmount2;
  String? _tipPercentagesAmount3;
  String? _tipPercentagesAmount4;
  String? _tipFixedAmount1;
  String? _tipFixedAmount2;
  String? _tipFixedAmount3;
  String? _tipFixedAmount4;
  String? _smartTip;
  String? _menuBgColor;
  String? _menuTextColor;
  String? _menuBgVideo;
  String? _menuItemTextColor;
  String? _menuItemBgColor;
  String? _menuOrderBgColor;
  String? _menuOrderTextColor;
  String? _menuCheckoutBgColor;
  String? _menuCheckoutTextColor;
  String? _stateTax;
  String? _tax;
  String? _testStripeTerminal;
  String? _stripeType;
  String? _adminId;
  String? _restaurantName;
  String? _restaurantAddress;
  String? _restaurantPhoneNumber;
  String? _restaurantCity;
Result copyWith({  String? id,
  String? name,
  String? logo,
  String? icon,
  String? takeoutButtonVisible,
  String? onTableButtonVisible,
  String? takeoutButtonText,
  String? onTableButtonText,
  String? backgroundDisplay,
  String? terminal,
  String? english,
  String? french,
  String? tipPercentagesAmount1,
  String? tipPercentagesAmount2,
  String? tipPercentagesAmount3,
  String? tipPercentagesAmount4,
  String? tipFixedAmount1,
  String? tipFixedAmount2,
  String? tipFixedAmount3,
  String? tipFixedAmount4,
  String? smartTip,
  String? menuBgColor,
  String? menuTextColor,
  String? menuBgVideo,
  String? menuItemTextColor,
  String? menuItemBgColor,
  String? menuOrderBgColor,
  String? menuOrderTextColor,
  String? menuCheckoutBgColor,
  String? menuCheckoutTextColor,
  String? stateTax,
  String? tax,
  String? testStripeTerminal,
  String? stripeType,
  String? adminId,
  String? restaurantName,
  String? restaurantAddress,
  String? restaurantPhoneNumber,
  String? restaurantCity,
}) => Result(  id: id ?? _id,
  name: name ?? _name,
  logo: logo ?? _logo,
  icon: icon ?? _icon,
  takeoutButtonVisible: takeoutButtonVisible ?? _takeoutButtonVisible,
  onTableButtonVisible: onTableButtonVisible ?? _onTableButtonVisible,
  takeoutButtonText: takeoutButtonText ?? _takeoutButtonText,
  onTableButtonText: onTableButtonText ?? _onTableButtonText,
  backgroundDisplay: backgroundDisplay ?? _backgroundDisplay,
  terminal: terminal ?? _terminal,
  english: english ?? _english,
  french: french ?? _french,
  tipPercentagesAmount1: tipPercentagesAmount1 ?? _tipPercentagesAmount1,
  tipPercentagesAmount2: tipPercentagesAmount2 ?? _tipPercentagesAmount2,
  tipPercentagesAmount3: tipPercentagesAmount3 ?? _tipPercentagesAmount3,
  tipPercentagesAmount4: tipPercentagesAmount4 ?? _tipPercentagesAmount4,
  tipFixedAmount1: tipFixedAmount1 ?? _tipFixedAmount1,
  tipFixedAmount2: tipFixedAmount2 ?? _tipFixedAmount2,
  tipFixedAmount3: tipFixedAmount3 ?? _tipFixedAmount3,
  tipFixedAmount4: tipFixedAmount4 ?? _tipFixedAmount4,
  smartTip: smartTip ?? _smartTip,
  menuBgColor: menuBgColor ?? _menuBgColor,
  menuTextColor: menuTextColor ?? _menuTextColor,
  menuBgVideo: menuBgVideo ?? _menuBgVideo,
  menuItemTextColor: menuItemTextColor ?? _menuItemTextColor,
  menuItemBgColor: menuItemBgColor ?? _menuItemBgColor,
  menuOrderBgColor: menuOrderBgColor ?? _menuOrderBgColor,
  menuOrderTextColor: menuOrderTextColor ?? _menuOrderTextColor,
  menuCheckoutBgColor: menuCheckoutBgColor ?? _menuCheckoutBgColor,
  menuCheckoutTextColor: menuCheckoutTextColor ?? _menuCheckoutTextColor,
  stateTax: stateTax ?? _stateTax,
  tax: tax ?? _tax,
  testStripeTerminal: testStripeTerminal ?? _testStripeTerminal,
  stripeType: stripeType ?? _stripeType,
  adminId: adminId ?? _adminId,
  restaurantName: restaurantName ?? _restaurantName,
  restaurantAddress: restaurantAddress ?? _restaurantAddress,
  restaurantPhoneNumber: restaurantPhoneNumber ?? _restaurantPhoneNumber,
  restaurantCity: restaurantCity ?? _restaurantCity,
);
  String? get id => _id;
  String? get name => _name;
  String? get logo => _logo;
  String? get icon => _icon;
  String? get takeoutButtonVisible => _takeoutButtonVisible;
  String? get onTableButtonVisible => _onTableButtonVisible;
  String? get takeoutButtonText => _takeoutButtonText;
  String? get onTableButtonText => _onTableButtonText;
  String? get backgroundDisplay => _backgroundDisplay;
  String? get terminal => _terminal;
  String? get english => _english;
  String? get french => _french;
  String? get tipPercentagesAmount1 => _tipPercentagesAmount1;
  String? get tipPercentagesAmount2 => _tipPercentagesAmount2;
  String? get tipPercentagesAmount3 => _tipPercentagesAmount3;
  String? get tipPercentagesAmount4 => _tipPercentagesAmount4;
  String? get tipFixedAmount1 => _tipFixedAmount1;
  String? get tipFixedAmount2 => _tipFixedAmount2;
  String? get tipFixedAmount3 => _tipFixedAmount3;
  String? get tipFixedAmount4 => _tipFixedAmount4;
  String? get smartTip => _smartTip;
  String? get menuBgColor => _menuBgColor;
  String? get menuTextColor => _menuTextColor;
  String? get menuBgVideo => _menuBgVideo;
  String? get menuItemTextColor => _menuItemTextColor;
  String? get menuItemBgColor => _menuItemBgColor;
  String? get menuOrderBgColor => _menuOrderBgColor;
  String? get menuOrderTextColor => _menuOrderTextColor;
  String? get menuCheckoutBgColor => _menuCheckoutBgColor;
  String? get menuCheckoutTextColor => _menuCheckoutTextColor;
  String? get stateTax => _stateTax;
  String? get tax => _tax;
  String? get testStripeTerminal => _testStripeTerminal;
  String? get stripeType => _stripeType;
  String? get adminId => _adminId;
  String? get restaurantName => _restaurantName;
  String? get restaurantAddress => _restaurantAddress;
  String? get restaurantPhoneNumber => _restaurantPhoneNumber;
  String? get restaurantCity => _restaurantCity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['logo'] = _logo;
    map['icon'] = _icon;
    map['Takeout_button_visible'] = _takeoutButtonVisible;
    map['OnTable_button_visible'] = _onTableButtonVisible;
    map['Takeout_button_text'] = _takeoutButtonText;
    map['OnTable_button_text'] = _onTableButtonText;
    map['background_display'] = _backgroundDisplay;
    map['terminal'] = _terminal;
    map['English'] = _english;
    map['French'] = _french;
    map['tip_percentages_amount1'] = _tipPercentagesAmount1;
    map['tip_percentages_amount2'] = _tipPercentagesAmount2;
    map['tip_percentages_amount3'] = _tipPercentagesAmount3;
    map['tip_percentages_amount4'] = _tipPercentagesAmount4;
    map['tip_fixed_amount1'] = _tipFixedAmount1;
    map['tip_fixed_amount2'] = _tipFixedAmount2;
    map['tip_fixed_amount3'] = _tipFixedAmount3;
    map['tip_fixed_amount4'] = _tipFixedAmount4;
    map['smart_tip'] = _smartTip;
    map['menu_bg_color'] = _menuBgColor;
    map['menu_text_color'] = _menuTextColor;
    map['menu_bg_video'] = _menuBgVideo;
    map['menu_item_text_color'] = _menuItemTextColor;
    map['menu_item_bg_color'] = _menuItemBgColor;
    map['menu_order_bg_color'] = _menuOrderBgColor;
    map['menu_order_text_color'] = _menuOrderTextColor;
    map['menu_checkout_bg_color'] = _menuCheckoutBgColor;
    map['menu_checkout_text_color'] = _menuCheckoutTextColor;
    map['state_tax'] = _stateTax;
    map['tax'] = _tax;
    map['test_stripe_terminal'] = _testStripeTerminal;
    map['stripe_type'] = _stripeType;
    map['admin_id'] = _adminId;
    map['restaurant_name'] = _restaurantName;
    map['restaurant_address'] = _restaurantAddress;
    map['restaurant_phone_number'] = _restaurantPhoneNumber;
    map['restaurant_city'] = _restaurantCity;
    return map;
  }

}