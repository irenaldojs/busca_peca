import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CatalogController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    for (int i = 0; i < catalog.pesquisa.length; i++) {
      textEditingControllers.add(TextEditingController());
    }
    ;
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    for (int i = 0; i < catalog.pesquisa.length; i++) {
      textEditingControllers[i].dispose();
    }
    ;
  }

  List<TextEditingController> textEditingControllers = [];
  Catalog catalog = Get.arguments;
}
