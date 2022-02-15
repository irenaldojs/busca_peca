import 'dart:developer';

import 'package:busca_peca/app/models/catalog_data_model.dart';
import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataRepository extends GetxController {
  Future<Map<String, dynamic>> listCatalogs() async {
    Map<String, dynamic> catalogs = {};
    try {
      var result =
          await FirebaseFirestore.instance.collection('catalogos').get();
      for (var doc in result.docs) {
        Map<String, dynamic> item = {};
        item['colunas'] = doc['colunas'].toString().split('/').toList();
        item['pesquisa'] = doc['pesquisa'].toString().split('/').toList();
        catalogs[doc['item']] = item;
      }
    } catch (e) {
      log(e.toString());
    }
    return catalogs;
  }

  Future<CatalogDataModel> catalogData(CatalogModel catalog,
      {String? car, String? age}) async {
    List<Map<String, dynamic>> list = [];
    try {
      if ((car == null || car == '') && (age == null || age.length < 4)) {
        var result =
            await FirebaseFirestore.instance.collection(catalog.item).get();
        for (var doc in result.docs) {
          Map<String, dynamic> item = {};
          item = doc.data();
          list.add(item);
          for (var colunm in catalog.colunas) {
            if (item[colunm] == null) {
              log(doc.id);
            }
          }
        }
      } else if (age == null || age.length < 4) {
        var result =
            await FirebaseFirestore.instance.collection(catalog.item).get();
        for (var doc in result.docs) {
          if (doc['carro'].toString().contains(car.toString())) {
            Map<String, dynamic> item = {};
            item = doc.data();
            list.add(item);
            for (var colunm in catalog.colunas) {
              if (item[colunm] == null) {
                log(doc.id);
              }
            }
          }
        }
      } else if (car != null && car != '' && age != null && age.length == 4) {
        var result =
            await FirebaseFirestore.instance.collection(catalog.item).get();
        for (var doc in result.docs) {
          if (doc['carro'].toString().contains(car.toString())) {
            Map<String, dynamic> item = {};
            item = doc.data();
            list.add(item);
            for (var colunm in catalog.colunas) {
              if (item[colunm] == null) {
                log(doc.id);
              }
            }

            List<String> ages = doc['ano'].toString().split('/').toList();
            bool testIsGreaterThan = false;
            if (ages[0] == '...') {
              testIsGreaterThan = true;
            } else if (int.parse(ages[0]) <= int.parse(age)) {
              testIsGreaterThan = true;
            }
            bool testIsLessThan = false;
            if (ages[1] == '...') {
              testIsLessThan = true;
            } else if (int.parse(ages[1]) >= int.parse(age)) {
              testIsLessThan = true;
            }

            if (testIsGreaterThan && testIsLessThan) {
              list.add(item);
            }
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return CatalogDataModel(item: list);
  }
}
