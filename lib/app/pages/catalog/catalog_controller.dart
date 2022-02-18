import 'package:busca_peca/app/repository/data_local_repository.dart';
import 'package:busca_peca/app/repository/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CatalogController extends GetxController {
 
  String catalog = Get.arguments[0];
  String version = Get.arguments[1];
  DataRepository data = Get.find();
  DataLocalRepository local = Get.find();

  var car = TextEditingController().obs;
  var year = 'Todos'.obs;
  var motor = TextEditingController().obs;
  var acd = false.obs;
  var dh = false.obs;
  var abs = false.obs;
  var ta = false.obs;
  var gnv = false.obs;

  title(){
    return catalog.toString().split('/')[2].toString().capitalize;
  }

  toUpperCaseCar() {
    car.value.text.toUpperCase();
  }

}
