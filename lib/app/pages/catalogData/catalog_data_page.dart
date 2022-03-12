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
          title: const Center(child: Text('')),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: controller.registerDataFilter(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var doc = snapshot.data![index];
                  return listData(doc, '');
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
