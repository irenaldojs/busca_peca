import 'package:busca_peca/app/models/register_catalog_model.dart';
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
        body: FutureBuilder<RegisterCatalog>(
          future: Get.arguments,
          builder:
              (BuildContext context, AsyncSnapshot<RegisterCatalog> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              RegisterCatalog query = snapshot.data!;
              return ListView.builder(
                itemCount: query.data.length,
                itemBuilder: (context, index) {
                  var doc = query.data[index];
                  return listData(doc, '');
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
