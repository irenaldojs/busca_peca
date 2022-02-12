import 'dart:developer';
import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataRepository extends GetxController {
  Future<List<Catalog>> listCatalogs() async {
    List<Catalog> catalogs = [];

    var result = await FirebaseFirestore.instance.collection('catalogos').get();
    for (var doc in result.docs) {
      var colunms = doc['colunas'].toString().split('/').toList();
      var search = doc['pesquisa'].toString().split('/').toList();
      var item = doc['item'];
      var catalog = Catalog(item: item, pesquisa: search, colunas: colunms);
      catalogs.add(catalog);
    }
    return catalogs;
  }
}
