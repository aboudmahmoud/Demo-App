import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:tsk/Data/Respostry.dart';
import 'package:tsk/Models/AddersModel.dart';
import 'package:tsk/Models/CategoriesModel.dart';
import 'package:tsk/Models/DealsModel.dart';
import 'package:tsk/Models/OffersModel.dart';

import '../Models/CartModel.dart';
import '../Models/NotfiationModel.dart';
import 'Constans.dart';

Widget Headaer(String titel) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Svg(Vector),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                width: 32,
                height: 32,
                image: Svg(mpasIcon, color: Colors.white),
              ),
              Text(
                titel,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        CircleAvatar(
          backgroundImage: AssetImage(naruto),
        )
      ],
    ),
  );
}

Widget Serachtextfield() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(

      decoration: InputDecoration(
          filled: true,
          fillColor: nearGray,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: nearGray),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintText: 'Search in thousands of products'),
      style: TextStyle(color: Colors.black),
    ),
  );
}

Widget BoxDataeInfo(
    String ImageAdders, String Adders1, String Adders2, String Adders3) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(12.0),
    ),
    padding: EdgeInsets.all(4),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image(
            height: 30,
            width: 30,
            image: AssetImage(ImageAdders),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Adders1,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                Adders2,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Text(Adders3,
                  style: TextStyle(
                    fontSize: 10,
                  )),
            ],
          ),
        )
      ],
    ),
  );
}

Widget Addersdata(List<AddesModel> adders) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (AddesModel adder in adders)
          BoxDataeInfo(adder.ImageAddes, adder.MainAddes, adder.DeatielAdders,
              adder.StratAdders)
        /* BoxDataeInfo(
            loaction,
            "Home Address",
            "Mustafa St. No:2",
            "Street x12"),
        BoxDataeInfo(
            loaction,
            "Office Address",
            "Axis Istanbul, B2 Blok",
            "Floor 2, Office 11"),*/
      ],
    ),
  );
}

Widget BoxCatgory(double heightofScrren,
    {required String CatgroyName, required String CatgroyImage}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(2.0),
        ),
        width: 60,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image(
            image: AssetImage(CatgroyImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        height: heightofScrren * 0.009,
      ),
      Text(
        CatgroyName,
        style: TextStyle(
            fontSize: 13, color: nearBalack, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: heightofScrren * 0.009,
      ),
      InkWell(
        onTap: () {
          NotfationModel.inc();
          bool NoIntemOnCart = true;
          for (int cart = 0; cart < Respostry.CartList.length; cart++) {
            if (Respostry.CartList[cart].itemName == CatgroyName) {
              Respostry.CartList[cart].inc();
              NoIntemOnCart = false;
              break;
            }
          }
          if (NoIntemOnCart) {
            Respostry.CartList.add(
                CartModel(itemName: CatgroyName, ImageIders: CatgroyImage));
          }

        },
        child: Text(
          "Buy",
          style: TextStyle(
            fontSize: 12,
            color: textGray,
          ),
        ),
      ),
    ],
  );
}

Widget Catgroys(double heightofScrren,
    {required List<CategoriesModel> list, required double widthoOfScreen}) {
  return Container(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: widthoOfScreen,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (CategoriesModel Catrgory in list)
                BoxCatgory(heightofScrren,
                    CatgroyName: Catrgory.CatgoryName!,
                    CatgroyImage: Catrgory.CatgoryImage!)
            ],
          ),
        ),
      ),
    ),
  );
}

Widget Deailbox(double width, double heightofScrren, DealsModel controller) {
  return Row(
    children: [
      Container(
        width: width * 0.31,
        height: heightofScrren * 0.15,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(2.0),
            image: DecorationImage(
                image: AssetImage(controller.dealsImage), fit: BoxFit.fill)),
        child: Align(
          alignment: const Alignment(-1.2, -1.4),
          child: InkWell(
            onTap: () {
              controller.isFavoreta = !controller.isFavoret;
            },
            child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: Svg(controller.isFavoret ? RedHart : Hart,
                        size: Size(24, 24)),
                  ),
                )),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.dealsName,
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: nearBalack),
            ),
            SizedBox(
              height: heightofScrren * 0.01,
            ),
            Text("$Pieces ${controller.NumberOfPiess}"),
            SizedBox(
              height: heightofScrren * 0.01,
            ),
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                Text(controller.LoactionfarAway),
              ],
            ),
            SizedBox(
              height: heightofScrren * 0.01,
            ),
            Row(children: [
              Text(
                " \$${controller.DealPrice} ",
                style: TextStyle(color: PriceColor),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                " \$${controller.OrgnalPrice} ",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough, color: textGray),
              )
            ])
          ],
        ),
      ),
      SizedBox(
        width: width * 0.04,
      )
    ],
  );
}

Widget DeailsList(double width, double heightofScrren,
    {required List<DealsModel> listDeals}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (DealsModel deilas in listDeals)
                Obx(() => Deailbox(width, heightofScrren, deilas))
            ],
          ),
        )),
  );
}

Widget Offerbox(double width, double heightofScrren, OffersModel ofres) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: OfferColor,
        border: Border.all(color: OfferColor),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image(
              image: AssetImage(ofres.ImageAdders),
              width: 150,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ofres.Type,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: PriceColor),
                  ),
                  Text(
                    ofres.Name,
                    style:
                        TextStyle(fontSize: width * 0.082, color: WhoperColor),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${ofres.DealPrice}",
                        style: TextStyle(fontSize: 20, color: PriceColor),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text("\$${ofres.OrgnalPrice}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            decoration: TextDecoration.lineThrough,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: heightofScrren * 0.018,
                  ),
                  Text(
                    ofres.AvablielTime,
                    style: TextStyle(fontSize: 9, color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget IconContairen(IconData icons) {
  return Container(
    decoration: BoxDecoration(
    color:ContierColorCOunter ,
      borderRadius: BorderRadius.circular(10.0),
    ),
    width: 40,
    height: 40,

    child: Icon(icons,color: MinsandAdd,),
  );
}

Widget CartBox(CartModel cartModel, double heightofScrren, double width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(2.0),
            ),
            width: 60,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image(
                image: AssetImage(cartModel.ImageAdder),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartModel.itemName,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: nearBalack),
                ),
                SizedBox(
                  height: heightofScrren * 0.008,
                ),
                Text(
                  "Price \$${cartModel.price}",
                  style:
                  TextStyle(fontSize: 12, color: textGray),
                ),
                SizedBox(
                  height: heightofScrren * 0.009,
                ),
                Text(
                  "Total \$${cartModel.totalPrice}",
                  style: TextStyle(color: Ftoatbutton),
                )
              ],
            ),
          )
        ],
      ),
      Row(

        children: [
          InkWell(
              onTap: (){
                cartModel.decars();
                if (cartModel.Quantntitiy==0){
                  Respostry.CartList.remove(cartModel);
                }
              },
              child: IconContairen(Icons.remove)),
          SizedBox(width: width*0.03,),
          Text("${cartModel.Quantntitiy}"),
          SizedBox(width: width*0.03,),
          InkWell(onTap: (){
            cartModel.inc();

          },child: IconContairen(Icons.add)),
        ],
      )
    ],
  );
}

Widget CartList(double heightofScrren, double width , List<CartModel> cartModels) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child:  SingleChildScrollView(
            child: Column(
              children: [

               for(CartModel cartModel in cartModels )CartBox(cartModel, heightofScrren, width),
              ],
            ),
          )
    ,
  );
}

