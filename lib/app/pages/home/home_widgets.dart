import 'dart:developer';
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

listTitle(HomeController controller, String catalog, String version) {
  return ListTile(
      title: Text(
        catalog.split('/')[2].capitalize!,
        style: const TextStyle(fontSize: 24),
      ),
      onTap: () {
        Get.toNamed('/catalog', arguments: [catalog, version]);
      });
}
