import 'dart:developer';

import 'package:busca_peca/app/pages/catalog/catalog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


var textStyle = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
filterCar(CatalogController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 2,
        child: Text('Carro', style: textStyle),
      ),
      Expanded(
          flex: 4,
          child: TextField(
            controller: controller.car.value,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.characters,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              border: const OutlineInputBorder(),
            ),
          ))
    ],
  );
}

filterAge(CatalogController controller) {
  var mask = MaskTextInputFormatter(mask: '####');
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 2,
        child: Text('Ano', style: textStyle),
      ),
      Expanded(
        flex: 1,
        child: TextField(
          controller: controller.age.value,
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
      )
    ],
  );
}

checkboxACD(CatalogController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Ar Condicionado',
        style: textStyle,
      ),
      Obx(() => Checkbox(
          value: controller.acd.value,
          onChanged: (value) {
            controller.acd.value = value ?? controller.acd.value;
          }))
    ],
  );
}

checkboxDH(CatalogController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Direção Hidráulica',
        style: textStyle,
      ),
      Obx(() => Checkbox(
          value: controller.dh.value,
          onChanged: (value) {
            controller.dh.value = value ?? controller.dh.value;
          }))
    ],
  );
}
checkboxGNV(CatalogController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'GNV',
        style: textStyle,
      ),
      Obx(() => Checkbox(
          value: controller.gnv.value,
          onChanged: (value) {
            controller.gnv.value = value ?? controller.gnv.value;
          }))
    ],
  );
}

checkboxABS(CatalogController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Freios ABS',
        style: textStyle,
      ),
      Obx(() => Checkbox(
          value: controller.abs.value,
          onChanged: (value) {
            controller.abs.value = value ?? controller.abs.value;
          }))
    ],
  );
}

checkboxTA(CatalogController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Transmissão Automática',
        style: textStyle,
      ),
      Obx(() => Checkbox(
          value: controller.ta.value,
          onChanged: (value) {
            controller.ta.value = value ?? controller.ta.value;
          }))
    ],
  );
}