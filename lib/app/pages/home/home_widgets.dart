import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:busca_peca/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

HomeController controller = Get.find();

/*
textFieldSearch(HomeController controller) => TextField(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(24))),
      ),
      onChanged: controller.searchOnChanged(),
    );
*/
class ListCatalogs extends StatelessWidget {
  const ListCatalogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Catalog>>(
      future: controller.searchCatalogs(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<Catalog> data = snapshot.data;
          int count = data.length;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: count,
              itemBuilder: (context, index) {
                Catalog item = data[index];
                return ListTile(
                    title: Text(
                      item.name.capitalize!,
                      style: const TextStyle(fontSize: 24),
                    ),
                    onTap: () {
                      controller.selectCatalog(item);
                      Get.toNamed('/catalogData');
                    });
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
