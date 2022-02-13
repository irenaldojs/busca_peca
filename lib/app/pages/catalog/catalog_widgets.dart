import 'package:busca_peca/app/pages/catalog/catalog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

CatalogController controller = Get.find();

filterCar() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'CARRO',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 6),
      TextField(
        controller: controller.car,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: const OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 12),
    ],
  );
}

filterAge() {
  var mask = MaskTextInputFormatter(mask: '####');
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'ANO',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 6),
      TextField(
        controller: controller.age,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: const OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 6),
       const Text('Obs: Preencha com 4 digitos')
    ],
  );
}
