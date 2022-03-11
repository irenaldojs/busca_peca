import 'dart:developer';

import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:busca_peca/app/models/register_catalog_model.dart';
import 'package:busca_peca/app/repository/data_filter.dart';
import 'package:busca_peca/app/repository/data_local_repository.dart';
import 'package:busca_peca/app/repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/data_interface.dart';
import '../../repository/firestore_repository.dart';

class CatalogController extends GetxController {
  Catalog catalog = Get.arguments[0];
  RegisterCatalog registerCatalog = Get.arguments[1];

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

  toUpperCaseCar() {
    car.value.text.toUpperCase();
  }

  Future<RegisterCatalog> GetFilterData() async {
    List<Map<String, dynamic>> data = registerCatalog.data;
    List<Map<String, dynamic>> dataFilter = DataFilter.catalogDataFilter(
      data,
      car: catalog.search.contains('carro') ? car.value.text : null,
      year: catalog.search.contains('ano') ? year.value : null,
      ccMotor: catalog.search.contains('motor') ? motor.value.text : null,
    );

    return RegisterCatalog(doc: catalog.name, data: dataFilter);
    
  }
}
