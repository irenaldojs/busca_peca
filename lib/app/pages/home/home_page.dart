import 'package:busca_peca/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.toNamed('/profile'),
          icon: Icon(
            Icons.account_circle,
            size: Get.mediaQuery.size.height * 0.05,
          ),
        ),
        title: const Center(child: Text('Catálogo de peças')),
      ),
    );
  }
}
