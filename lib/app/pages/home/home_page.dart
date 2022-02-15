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
      body: FutureBuilder<Map<String, dynamic>>(
        future: controller.data.listCatalogs(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data;
            int count = data.keys.length;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: count,
                itemBuilder: (context, index) {
                  Map<String, dynamic> item = snapshot.data;
                  return listTitle(data, item.keys.elementAt(index));
                },
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
