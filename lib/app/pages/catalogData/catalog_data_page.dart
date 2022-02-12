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
          title: Center(child: Text(controller.catalog.item.toString().toUpperCase())),
        ),
        body: FutureBuilder<CatalogDataModel>(
          future: controller.data.catalogData(controller.catalog),
          builder: (BuildContext context, AsyncSnapshot<CatalogDataModel> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              CatalogDataModel catalog = snapshot.data!;
              return ListView.builder(
                itemCount: catalog.item.length,
                itemBuilder: (context, index) {
                  return listData(catalog.item[index]);
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ));
  }
}
