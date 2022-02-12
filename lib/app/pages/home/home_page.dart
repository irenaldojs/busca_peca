import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:busca_peca/app/pages/home/home_controller.dart';
import 'package:busca_peca/app/pages/home/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: iconButtonBar(controller),
        title: textFieldSearch(controller),
      ),
      body: FutureBuilder<List<Catalog>>(
        future: controller.data.listCatalogs(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            List<Catalog> catalogs = snapshot.data;
            return ListView.builder(
              itemCount: catalogs.length,
              itemBuilder: (context, index){
                Catalog catalog = catalogs[index];
                return ListTile(
                  title: Text(catalog.item),
                  onTap: () {
                    Get.toNamed('/catalog', arguments: catalog);
                  },
                );
              },
            );
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
