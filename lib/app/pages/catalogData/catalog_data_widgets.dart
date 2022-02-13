import 'package:busca_peca/app/pages/catalogData/catalog_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

CatalogDataController controller = Get.find();

Widget listData(Map<String, dynamic> item) {
  TextStyle textStyle = const TextStyle(fontSize: 24, color: Colors.black);
  TextStyle textStyleCar = const TextStyle(
      fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold);

  List<Widget> rows = [];
  for (var row in item.keys) {
    bool car = row == 'carro';
    Widget temp = Container(
        decoration: BoxDecoration(
            border:
                !car ? const Border.symmetric(horizontal: BorderSide()) : null),
        child: row != 'carro'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(row, style: textStyle),
                  Text(
                    item[row].toString().toUpperCase(),
                    style: textStyle,
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item['montadora'].toString().toUpperCase() +
                        ' ' +
                        item[row].toString().toUpperCase(),
                    style: textStyleCar,
                  )
                ],
              ));
    if (row != 'montadora') rows.add(temp);
  }

  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(36))),
    child: Column(
      children: rows,
    ),
  );
}
