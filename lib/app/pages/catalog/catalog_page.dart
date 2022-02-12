import 'package:busca_peca/app/models/catalogo_model.dart';
import 'package:busca_peca/app/pages/catalog/catalog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogPage extends GetView<CatalogController> {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Catalogo catalogo = Get.arguments;
    for (int i = 0; i < catalogo.pesquisa.length; i++) {
      controller.textEditingControllers.add(TextEditingController());
    }
    ;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(catalogo.item)),
      ),
      body: ListView.builder(
        itemCount: catalogo.pesquisa.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(                  
                  controller: controller.textEditingControllers[index],
                  decoration: InputDecoration(
                    labelText: catalogo.pesquisa[index]
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
