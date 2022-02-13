import 'dart:developer';

import 'package:busca_peca/app/models/catalog_data_model.dart';
import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataRepository extends GetxController {
  Future<List<CatalogModel>> listCatalogs() async {
    List<CatalogModel> catalogs = [];

    var result = await FirebaseFirestore.instance.collection('catalogos').get();
    for (var doc in result.docs) {
      var colunms = doc['colunas'].toString().split('/').toList();
      var search = doc['pesquisa'].toString().split('/').toList();
      var item = doc['item'];
      var catalog =
          CatalogModel(item: item, pesquisa: search, colunas: colunms);
      catalogs.add(catalog);
    }
    return catalogs;
  }

  Future<CatalogDataModel> catalogData(CatalogModel catalog,
      {String? car, String? age}) async {
    List<Map<String, dynamic>> list = [];

    if ((car == null || car == '') && (age == null || age.length < 4)) {
      var result =
          await FirebaseFirestore.instance.collection(catalog.item).get();
      for (var doc in result.docs) {
        Map<String, dynamic> item = {};
        for (int i = 0; i < catalog.colunas.length; i++) {
          item[catalog.colunas[i]] = doc[catalog.colunas[i]];
        }
        list.add(item);
      }
    } else if (age == null || age.length < 4) {
      var result =
          await FirebaseFirestore.instance.collection(catalog.item).get();
      for (var doc in result.docs) {
        if (doc['carro'].toString().contains(car.toString())) {
          Map<String, dynamic> item = {};
          for (int i = 0; i < catalog.colunas.length; i++) {
            item[catalog.colunas[i]] = doc[catalog.colunas[i]];
          }
          list.add(item);
        }
      }
    } else if (car != null && car != '' && age != null && age.length == 4) {
      var result =
          await FirebaseFirestore.instance.collection(catalog.item).get();
      for (var doc in result.docs) {        
        if (doc['carro'].toString().contains(car.toString())){
        Map<String, dynamic> item = {};
        
        for (int i = 0; i < catalog.colunas.length; i++) {
          item[catalog.colunas[i]] = doc[catalog.colunas[i]];
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
    return CatalogDataModel(item: list);
  }
}

