import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:tsk/Models/NotfiationModel.dart';
import 'package:tsk/screen/CartScreen.dart';
import 'package:tsk/screen/MainScreen.dart';

import 'Helper/Constans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    double heightofScrren = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton:FloatingActionButton( //Floating action button on Scaffold
          onPressed: (){
            //code to execute on button press
          },
          backgroundColor: Ftoatbutton,
          child: Icon(Icons.add), //icon inside button
        ),


        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //floating action button position to center

        bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
          color:bottomApbarColor,
          shape: CircularNotchedRectangle(), //shape of notch
          notchMargin: 5, //notche margin between floating button and bottom appbar
          child: Row( //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: Icon(Icons.home, color: Ftoatbutton,), onPressed: () {},),
              IconButton(icon: Icon(Icons.search, color: Ftoatbutton,), onPressed: () {},),
              IconButton(icon: Icon(Icons.add_business_outlined, color: Ftoatbutton,), onPressed: () {},),
              InkWell(
                onTap: (){
                  NotfationModel.NotfationVislblty=false;
                  Get.to(()=>CartScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width:width*0.05,
                    height: heightofScrren*0.03,

                    decoration: BoxDecoration(


                        image: DecorationImage(
                            image: Svg(Wallet,color: Ftoatbutton),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Obx(
                     ()=> Visibility(
                          visible:NotfationModel.NotfationVislblty,
                        child: Align(
                          alignment: const Alignment(3, -5),

                          child: Text(
                            "${NotfationModel.NotfiacCounter}",
                            style: TextStyle(
                              backgroundColor: Colors.red,
                              fontSize:15
                            ),
                          ),

                        ),
                      ),
                    ),),
                ),
              ),

            ],
          ),
        ),
      body: MainScreen()
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
