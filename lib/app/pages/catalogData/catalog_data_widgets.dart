import 'dart:developer';

import 'package:busca_peca/app/models/catalog_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget listData(Map<String, dynamic> item) {
  TextStyle textStyle = const TextStyle(fontSize: 30);
  TextStyle textStyleOdd = const TextStyle(fontSize: 30, color: Colors.black);
  List<Widget> rows = [];
  for (var row in item.keys) {
    bool odd = rows.length % 2 != 0;
    Widget temp = Container(
        color: odd ? Colors.black : Colors.grey.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              row,
              style: odd ? textStyle : textStyleOdd,
            ),
            Text(
              item[row],
              style: odd ? textStyle : textStyleOdd,
            )
          ],
        ));
    rows.add(temp);
  }

  return Container(
    padding: const EdgeInsets.all(10),
    //margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(),
    ),
    child: Column(
      children: rows,
    ),
  );
}
