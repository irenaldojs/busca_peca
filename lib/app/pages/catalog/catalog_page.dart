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
        child: Text(controller.catalog.name.capitalize!),
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              filterCar(controller),
              const SizedBox(height: 10),
              filterAgeDropDown(controller),
              const SizedBox(height: 10),
              filterMotor(controller),
              const SizedBox(height: 10),
              checkboxACD(controller),
              const SizedBox(height: 10),
              checkboxDH(controller),
              const SizedBox(height: 10),
              checkboxGNV(controller),
              const SizedBox(height: 10),
              checkboxABS(controller),
              const SizedBox(height: 10),
              checkboxTA(controller)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(Icons.search),
        onPressed: () {
          Get.toNamed('catalogData', arguments: controller.GetData());
        },
      ),
    );
  }
}
