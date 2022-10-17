import 'package:get/get.dart';
import 'package:tsk/Helper/Constans.dart';
import 'package:tsk/Models/CartModel.dart';
import 'package:tsk/Models/CategoriesModel.dart';
import 'package:tsk/Models/DealsModel.dart';
import 'package:tsk/Models/NotfiationModel.dart';
import 'package:tsk/Models/OffersModel.dart';

import '../Models/AddersModel.dart';
import '../screen/CartScreen.dart';
class Respostry{
  //Privide daata static but it can't be totuched form out side
  static final List<AddesModel> _adderModel=[
      AddesModel(
          ImageAddes:loaction,
          MainAddes:"Home Address",
          DeatielAdders:"Mustafa St. No:2",
          StratAdders:"Street x12"
      ),
    AddesModel(
        ImageAddes:loaction,
        MainAddes:"Office Address",
        DeatielAdders:"Axis Istanbul, B2 Blok",
        StratAdders:"Floor 2, Office 11"
    ),
  ];
  static final List<CategoriesModel> _catgriyes =[
    CategoriesModel(
      Catgoryimage: flower,
      CaregorisesName: "Flower",
    ),
    CategoriesModel(
      Catgoryimage: fruits,
      CaregorisesName: "Fruits",
    ),
    CategoriesModel(
      Catgoryimage: Vegetables,
      CaregorisesName: "Vegetables",
    ),
    CategoriesModel(
      Catgoryimage: Steak,
      CaregorisesName: "Steak",
    ),
    CategoriesModel(
      Catgoryimage: Fish,
      CaregorisesName: "Fish",
    ),
  ];
  static final List<DealsModel> _deails =[
   DealsModel(
      DeailsImage: IceCream,
      ItemName: "Summer Sun Ice Cream Pack",
      NumberOfPiess: 5,
      userFarLoction: "15 Minutes Away",
      dealPriec: 12,
      Price: 18
    ),
  DealsModel(
        DeailsImage: GamingPc,
        ItemName: "Gamming  PC New one",
        NumberOfPiess: 1,
        userFarLoction: "15 Minutes Away",
        dealPriec: 120,
        Price: 180
    ),
  ];
  static final OffersModel _Offers =
    OffersModel(
     "Mega",
        GamingPc,
     "WHOPPER",
      "* Available until 24 December 2020",
      17,
      32
    );
  static NotfationModel notfationModel = NotfationModel();

  static   List<CartModel>  _CartList=<CartModel>[].obs;

  static List<CartModel> get CartList => _CartList;

  static set CartList(List<CartModel> value) {
    _CartList = value;
  }

  static OffersModel get Offers => _Offers;

  static List<DealsModel> get deails => _deails;

  static List<AddesModel> get AdderModel{
    return _adderModel;
  }
  static List<CategoriesModel> get CatgroyList{
    return _catgriyes;
  }
}
