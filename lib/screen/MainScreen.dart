import 'package:flutter/material.dart';
import 'package:tsk/Helper/WadigetCompantes.dart';
import 'package:tsk/Data/Respostry.dart';
import 'package:tsk/Models/AddersModel.dart';
import 'package:tsk/Models/CategoriesModel.dart';
import 'package:tsk/Models/DealsModel.dart';

import '../Helper/Constans.dart';
import '../Models/OffersModel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<AddesModel> adders = Respostry.AdderModel;
  List<CategoriesModel> catgoreys = Respostry.CatgroyList;
  List<DealsModel> deile = Respostry.deails;
  OffersModel ofres = Respostry.Offers;

  @override
  Widget build(BuildContext context) {
    double heightofScrren = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Headaer(Name),
          Serachtextfield(),
          Addersdata(adders),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Explore,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: nearBalack),
                ),
                Text(
                  All,
                  style: TextStyle(color: textGray),
                ),
              ],
            ),
          ),
          Catgroys(heightofScrren, list: catgoreys, widthoOfScreen: width),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text(
                  Deals,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: nearBalack),
                ),
              ],
            ),
          ),
          DeailsList(width, heightofScrren, listDeals: deile),
          Offerbox(width, heightofScrren, ofres)
        ]),
      )),
    );
  }
}
