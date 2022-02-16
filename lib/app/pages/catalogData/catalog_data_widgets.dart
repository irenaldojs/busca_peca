import 'dart:developer';

import 'package:busca_peca/app/pages/catalogData/catalog_data_controller.dart';
import 'package:busca_peca/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';

CatalogDataController controller = Get.find();
AuthService auth = Get.find();

Widget listData(Map<String, dynamic> data, String doc) {
  TextStyle textStyle = const TextStyle(
    fontSize: 24,
    color: Colors.black,
  );
  TextStyle textStyleAge = const TextStyle(
    fontSize: 28,
    color: Colors.black,
  );
  TextStyle textStyleCar = const TextStyle(
      fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold);
  TextStyle textStyleAutomaker = const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic);

  List<Widget> rows = [];

  for (var row in data.keys) {
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
                    data[row].toString().toUpperCase(),
                    style: textStyle,
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data['montadora'].toString().toUpperCase(),
                    style: textStyleAutomaker,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  AutoSizeText(
                    data[row].toString().toUpperCase(),
                    style: textStyleCar,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    data['ano'].toString().toUpperCase(),
                    style: textStyleAge,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ));
    if (row != 'montadora' && row != 'ano' && row != 'colunas') rows.add(temp);
  }

  editButtom() {
    return ElevatedButton(
        onPressed: () {
          log(doc);
        },
        child: const Text(
          'Editar',
        ));
  }

  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(36))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rows +
          [
            auth.localUser!.email == 'irenaldojs@gmail.com'
                ? editButtom()
                : Container(),
          ],
    ),
  );
}
