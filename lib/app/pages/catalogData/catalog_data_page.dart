import 'catalog_data_controller.dart';
import 'catalog_data_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogDataPage extends GetView<CatalogDataController> {
  const CatalogDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.offAllNamed('/home'),
          icon: Icon( 
            Icons.home_outlined,
            size: Get.mediaQuery.size.height * 0.05,
          ),
        ),
        title: Center(
            child: Text(
          controller.dataController.catalog!.name.capitalize!,
          style: TextStyle(fontSize: Get.mediaQuery.size.height * 0.035),
        )),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/filter'),
            icon: Icon(
              Icons.search_outlined,
              size: Get.mediaQuery.size.height * 0.05,
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: const ListData(),
    );
  }
}
