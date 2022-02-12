import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:busca_peca/app/models/catalogo_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  Future<List<Catalogo>> listCatalogs() async {
    List<Catalogo> _catalogs = [];
    var result = await FirebaseFirestore.instance.collection('catalogos').get();
    for (var doc in result.docs) {
      var colunms = doc['colunas'].toString().split('/').toList();
      var search = doc['pesquisa'].toString().split('/').toList();
      var item = doc['item'];
      var catalog = Catalogo(item: item, pesquisa: search, colunas: colunms);
      _catalogs.add(catalog);
    }
    return _catalogs;
  }

  searchOnChanged(){}
}
