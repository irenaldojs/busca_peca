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

  Future<CatalogDataModel> catalogData(CatalogModel catalog) async {
    
    List<Map<String, dynamic>> list = [];
    var result =
        await FirebaseFirestore.instance.collection(catalog.item).get();
    for (var doc in result.docs) {
      Map<String, dynamic> item = {};
      for (int i = 0; i < catalog.colunas.length; i++) {
        item[catalog.colunas[i]] = doc[catalog.colunas[i]];
      }
      list.add(item);
    }    
    return CatalogDataModel(item: list);
  }
}
