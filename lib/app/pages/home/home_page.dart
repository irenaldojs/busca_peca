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
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/profile'),
            icon: Icon(
              Icons.account_circle,
              size: Get.mediaQuery.size.height * 0.06,
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: const ListCatalogs(),
    );
  }
}
