import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:busca_peca/app/repository/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CatalogController extends GetxController {
  
  CatalogModel catalog = Get.arguments;
  DataRepository data = Get.find();

  var car = TextEditingController().obs;
  var age = TextEditingController().obs;
  var acd = false.obs;
  var dh = false.obs;

  toUpperCaseCar(){
    car.value.text.toUpperCase();
  }
} 
