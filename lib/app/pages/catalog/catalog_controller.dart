import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:busca_peca/app/models/register_catalog_model.dart';
import 'package:busca_peca/app/repository/data_local_repository.dart';
import 'package:busca_peca/app/repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/cloud_data_interface.dart';
import '../../repository/firestore_repository.dart';

class CatalogController extends GetxController {
 
  Catalog catalog = Get.arguments;

  DataRepository data = Get.find();
  DataLocalRepository local = Get.find();
  ICloudData catalogsRepository = FirestoreRepository();

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
  Future<RegisterCatalog> GetData () async {
    return await catalogsRepository.catalogData(catalog);
  }
}
