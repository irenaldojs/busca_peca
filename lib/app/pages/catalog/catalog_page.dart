import 'package:busca_peca/app/pages/catalog/catalog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'catalog_widgets.dart';

class CatalogPage extends GetView<CatalogController> {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(controller.catalog.item.toString().toUpperCase())),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              filterCar(),
              filterAge(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(Icons.search),
        onPressed: () {

          Get.toNamed('/catalogData', arguments: controller.data.catalogData(controller.catalog, car: controller.car.text, age: controller.age.text));
        }
            ,
      ),
    );
  }
}
