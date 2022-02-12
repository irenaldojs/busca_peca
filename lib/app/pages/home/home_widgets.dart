import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:busca_peca/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

iconButtonBar(HomeController controller) => IconButton(
      onPressed: () => Get.toNamed('/profile'),
      icon: Icon(
        Icons.account_circle,
        size: Get.mediaQuery.size.height * 0.05,
      ),
    );

textFieldSearch(HomeController controller) => TextField(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(24))),
      ),
      onChanged: controller.searchOnChanged(),
    );

listTitle(CatalogModel catalog) {
  return ListTile(
      title: Text(
        catalog.item.capitalize.toString(),
        style: TextStyle(fontSize: 20),
      ),
      onTap: () {
        Get.toNamed('/catalog', arguments: catalog);
      });
}
