import 'package:busca_peca/app/models/catalog_data_model.dart';
import 'package:busca_peca/app/pages/catalogData/catalog_data_controller.dart';
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
        body: FutureBuilder<Map<String, dynamic> >(
          future: Get.arguments,
          builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              Map<String, dynamic> query = snapshot.data!;
              return ListView.builder(
                itemCount: query.length,
                itemBuilder: (context, index) {
                  var doc = query.keys.elementAt(index);
                  return listData( query[doc], doc );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
