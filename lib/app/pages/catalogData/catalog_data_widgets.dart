import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import 'catalog_data_controller.dart';

TextStyle textStyle = const TextStyle(fontSize: 24, color: Colors.black);
TextStyle textStyleAge = const TextStyle(fontSize: 28, color: Colors.black);
TextStyle textStyleCar = const TextStyle(
    fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold);
TextStyle textStyleAutomaker = const TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic);

CatalogDataController controller = Get.find();

class ListData extends StatelessWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: controller.registerDataFilter(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<Map<String, dynamic>> data = snapshot.data;
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                List<Widget> rows = [];
                for (var row in data[index].keys) {
                  bool car = row == 'carro';
                  Widget temp = Container(
                      decoration: BoxDecoration(
                          border: !car
                              ? const Border.symmetric(horizontal: BorderSide())
                              : null),
                      child: row != 'carro'
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(row, style: textStyle),
                                Text(
                                  data[index][row].toString().toUpperCase(),
                                  style: textStyle,
                                )
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  data[index]['montadora']
                                      .toString()
                                      .toUpperCase(),
                                  style: textStyleAutomaker,
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                AutoSizeText(
                                  data[index][row].toString().toUpperCase(),
                                  style: textStyleCar,
                                  maxLines: 1,
                                ),
                                AutoSizeText(
                                  data[index]['ano'].toString().toUpperCase() == '.../...' ? 'TODOS' : data[index]['ano'].toString().toUpperCase(),
                                  style: textStyleAge,
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ));
                  if (row != 'montadora' && row != 'ano' && row != 'colunas')
                    rows.add(temp);
                }
                return Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(18))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: rows,
                  ),
                );
              });
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
