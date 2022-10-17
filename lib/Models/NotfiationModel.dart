import 'package:get/get.dart';
class NotfationModel extends GetxController{

  static var _NotfationVislblty=false.obs;
  static var _NotfiacCounter=0.obs;


  static get NotfationVislblty => _NotfationVislblty.value;

  static set NotfationVislblty(value) {
    _NotfationVislblty.value = value;
    if( _NotfationVislblty.value==false){
      _NotfiacCounter.value=0;
    }

  }
  static get NotfiacCounter => _NotfiacCounter.value;

static void inc(){
  _NotfationVislblty.value=true;
  _NotfiacCounter.value++;
}
}