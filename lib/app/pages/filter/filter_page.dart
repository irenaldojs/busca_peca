import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'filter_controller.dart';
import 'filter_widgets.dart';

class FilterPage extends GetView<FilterController> {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          controller.dataController.catalog!.name.capitalize!,
          style: TextStyle(fontSize: Get.mediaQuery.size.height * 0.035),
        )),
        actions: [
          IconButton(
            onPressed: () => controller.cleanControllers(),
            icon: Icon(
              Icons.cleaning_services_outlined,
              size: Get.mediaQuery.size.height * 0.05,
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: const [
              FilterCar(),
              SizedBox(height: 10),
              FilterYerDrowDown(),
              SizedBox(height: 10),
              FilterMotor(),
              SizedBox(height: 10),
              CheckBoxACD(),
              SizedBox(height: 10),
              CheckBoxDH(),
              SizedBox(height: 10),
              CheckBoxGNV(),
              SizedBox(height: 10),
              CheckBoxABS(),
              SizedBox(height: 10),
              CheckBoxTA(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(Icons.search),
        onPressed: () {
          controller.getFilterData();
          Get.offNamed('/catalogData');
        },
      ),
    );
  }
}
