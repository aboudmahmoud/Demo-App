
import 'package:get/get.dart';
class DealsModel extends GetxController{
String? _dealsName;
String? _dealsImage;
int? _NumberOfPiess;
String? _LoactionfarAway;
int? _DealPrice;
int? _OrgnalPrice;
var _isFavoret=false.obs;
init(){

}
DealsModel({required String ItemName,
  required int NumberOfPiess,
  required String DeailsImage,
  required String userFarLoction,
  required int dealPriec,required int Price,bool isFavoret=false}){
  this._dealsName=ItemName;
  this._NumberOfPiess=NumberOfPiess;
  this._LoactionfarAway=userFarLoction;
  this._DealPrice=dealPriec;
  this._OrgnalPrice=Price;
  this._dealsName=ItemName;
  this._isFavoret.value=isFavoret;
  this._dealsImage=DeailsImage;
}

String get dealsImage => _dealsImage!;

  String get dealsName => _dealsName!;

  bool get isFavoret => _isFavoret!.value;


  set isFavoreta(bool value) {
    _isFavoret.value = value;

  }

int get NumberOfPiess => _NumberOfPiess!;

int get OrgnalPrice => _OrgnalPrice!;

  int get DealPrice => _DealPrice!;

  String get LoactionfarAway => _LoactionfarAway!;
}

