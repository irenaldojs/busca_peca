import 'dart:developer';
import 'package:busca_peca/app/models/catalogo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataService extends GetxController {

  List<Catalogo> catalogs = [];

  listCatalogs() async {
    var result = await FirebaseFirestore.instance.collection('catalogos').get();
    for (var doc in result.docs) {
      var colunms = doc['colunas'].toString().split('/').toList();
      var search = doc['pesquisa'].toString().split('/').toList();
      var item = doc['item'];
      var catalog = Catalogo(item: item, pesquisa: search, colunas: colunms);
      catalogs.add(catalog);
    }
    log(catalogs.length.toString());
  }
}

 /*
          Catalogo catalog = Catalogo(
            item: doc['item'],
            pesquisa: doc['pesquisa'].toString().split('/').toList(),
            colunas: doc['colunas'].toString().split('/').toList(),
          );
          catalogs.add(catalog);
          */