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
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(title: Text('ola $index'),);
        },
      ),
    );
  }
}
