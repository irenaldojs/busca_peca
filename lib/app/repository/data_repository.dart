import 'dart:developer';
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
        item['version'] = doc['version'];
        catalogs[doc['item']] = item;
      }
    } catch (e) {
      log(e.toString());
    }
    return catalogs;
  }

  Future<Map<String, dynamic>> catalogData(Map<String, dynamic> catalog,
      {String? car, String? year}) async {
    var collection = catalog.keys.elementAt(0).split('/')[2];
    Map<String, dynamic> query = {};
    var result = await FirebaseFirestore.instance.collection(collection).get();

    for (var doc in result.docs) {
      if (!doc['carro'].toString().contains(car!)) {
        // Testa se a variável 'car' contém no documento ['carro']
        continue;
      }
      if (year != 'Todos') {
        // Testa se a variável 'year' nnão é 'Todos'
        List years = doc['ano']
            .toString()
            .split('/'); // Separa o ano inicial do ano final
        int yearInt = int.parse(year!); // Converte a variável 'year' em inteiro
        if (years[0] != '...') {
          // Testa se o ano inicial não é vazio
          int start = int.parse(years[0]); // Converte o ano inicial em inteiro
          if (yearInt < start) {
            // Testa se o ano inicial da busca é menor que a do documento
            continue;
          }
        }
        if (years[1] != '...') {
          // Testa se o ano final não é vazio
          int end = int.parse(years[1]); // Converte o ano final em inteiro
          if (yearInt > end) {
            // Testa se o ano final da busca é menor que a do documento
            continue;
          }
        }
      }
      query[doc.id] = doc.data();
      query[doc.id]['colunas'] = catalog[catalog.keys.elementAt(0)]['colunas'];
    }
    return query;
  }

  Future<Map<String, dynamic>> returnCatalogData(String collection) async {
    Map<String, dynamic> data = {};
    var _collection = collection.split('/')[2];

    var result = await FirebaseFirestore.instance.collection(_collection).get();
    for (var doc in result.docs) {
      data[doc.id] = doc.data();
    }
    return data;
  }

  Future<int> returnCloudVersion(String nameDocument) async {
    var document =
        await FirebaseFirestore.instance.collection('catalogos').get();
    var version = 0;
    var data = document.docs;
    for (var doc in data) {
      if (doc['item'] == nameDocument) {
        version = doc['version'];
      }
    }

    return version;
  }
}
