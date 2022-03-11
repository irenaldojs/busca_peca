import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:busca_peca/app/pages/home/home_controller.dart';
import 'package:busca_peca/app/repository/data_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/firestore_repository.dart';

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

listTitle(HomeController controller, Catalog catalog) {
  return ListTile(
      title: Text(
        catalog.name.capitalize!,
        style: const TextStyle(fontSize: 24),
      ),
      onTap: () async {
        
        IData catalogsRepository = FirestoreRepository();
        Get.toNamed('/catalog', arguments: [catalog, await catalogsRepository.catalogData(catalog)]);
      });
}
