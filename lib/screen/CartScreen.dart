import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

import 'package:tsk/Data/Respostry.dart';
import 'package:tsk/Helper/Constans.dart';
import 'package:tsk/Helper/WadigetCompantes.dart';
import 'package:tsk/Models/CartModel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartModel> cartModel = Respostry.CartList;

  @override
  Widget build(BuildContext context) {
    double heightofScrren = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
        },
        backgroundColor: Ftoatbutton,
        child: Icon(Icons.add), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: bottomApbarColor,
        shape: CircularNotchedRectangle(),
        //shape of notch
        notchMargin: 5,
        //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Ftoatbutton,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Ftoatbutton,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.add_business_outlined,
                color: Ftoatbutton,
              ),
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width * 0.05,
                height: heightofScrren * 0.03,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Svg(Wallet, color: Ftoatbutton),
                        fit: BoxFit.fill)),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Headaer(OtherName),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      Cart,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: nearBalack),
                    ),
                  ],
                ),
              ),
              Obx(() =>  CartList(heightofScrren, width,cartModel))
            ],
          ),
        ),
      ),
    );
  }




}
