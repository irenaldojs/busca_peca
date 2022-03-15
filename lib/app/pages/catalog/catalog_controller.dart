import 'dart:developer';
import 'package:busca_peca/app/models/register_catalog_model.dart';
import 'package:busca_peca/app/repository/data_controller.dart';
import 'package:busca_peca/app/repository/data_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogController extends GetxController {
  DataController dataController = Get.find();

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

  getFilterData() {
    List<Map<String, dynamic>> data = dataController.registerCatalog!.data;
    List<Map<String, dynamic>> dataFilter = DataFilter.catalogDataFilter(
      data,
      car: dataController.catalog!.search.contains('carro')
          ? car.value.text
          : null,
      year: dataController.catalog!.search.contains('ano') ? year.value : null,
      ccMotor: dataController.catalog!.search.contains('motor')
          ? motor.value.text
          : null,
    );
    dataController.registerCatalogFilter =
        RegisterCatalog(doc: dataController.catalog!.name, data: dataFilter);
  }

  List<String> getSuggestionsCars(String query) {
    List<String> listCars = [];
    for (var item in dataController.registerCatalog!.data) {
      if (item['carro'] != null) {
        String add = item['carro'].toString().toUpperCase();
        bool verify = false;
        for (String verifyTest in listCars) {
          if (verifyTest == add) verify = true;
        }
        if (!verify) listCars.add(add);
      }
    }

    List<String> suggestion = List.of(listCars).where((suggestionCar) {
      final carLower = suggestionCar.toLowerCase();
      final queryLower = query.toLowerCase();
      return carLower.contains(queryLower);
    }).toList();

    return suggestion;
  }
}
