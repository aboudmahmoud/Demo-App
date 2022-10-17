import 'package:get/get.dart';

class CartModel  {
  var _ImageAdder="".obs;
var _itemName="".obs;
var _price=0.obs;
var  _totalPrice=0.obs;
var _Quantntitiy=0.obs;

CartModel({var itemName="",var ImageIders,var price=10,var Quantntitiy=1}){
  _itemName.value=itemName;
  _ImageAdder.value=ImageIders;
  _price.value=price;
  _totalPrice.value=price;
  _Quantntitiy.value=Quantntitiy;
}

  get ImageAdder => _ImageAdder.value;

  set ImageAdder(value) {
    _ImageAdder = value;
  }

  String get itemName => _itemName.value;

  set itemName(String value) {
    _itemName.value = value;
  }

  int get price => _price.value;

  int get Quantntitiy => _Quantntitiy.value;

  set Quantntitiy(int value) {
    _Quantntitiy.value = value;
  }

  int get totalPrice => _totalPrice.value;

  set totalPrice(int value) {
    _totalPrice.value = value;
  }

  set price(int value) {
    _price.value = value;
  }
  void inc(){
    _totalPrice.value=_totalPrice.value+_price.value;
    _Quantntitiy.value++;
  }
  void decars(){
    if(_Quantntitiy!=0)
      {
        _totalPrice.value=_totalPrice.value-_price.value;
        _Quantntitiy.value--;
      }

  }
}
