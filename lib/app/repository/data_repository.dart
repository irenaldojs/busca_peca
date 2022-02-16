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
        catalogs[doc['item']] = item;
      }
    } catch (e) {
      log(e.toString());
    }
    return catalogs;
  }

  Future<Map<String, dynamic>> catalogData(Map<String, dynamic> catalog,
      {String? car, String? year}) async {
    Map<String, dynamic> query = {};
    var result = await FirebaseFirestore.instance
        .collection(catalog.keys.elementAt(0))
        .get();
    List colunas = [];

    for (var snapshot in catalog.values) {
      List colunas = snapshot['colunas'];
    }
    for (var doc in result.docs) {
      if (!doc['carro'].toString().contains(car!)) continue; // Testa se a variável 'car' contém no documento ['carro']
      if (year != 'Todos') {  // Testa se a variável 'year' nnão é 'Todos'
        List years = doc['ano'].toString().split('/'); // Separa o ano inicial do ano final
        int yearInt = int.parse(year!); // Converte a variável 'year' em inteiro
        if (years[0] != '...') {  // Testa se o ano inicial não é vazio
          int start = int.parse(years[0]); // Converte o ano inicial em inteiro
          if (yearInt < start) continue; // Testa se o ano inicial da busca é menor que a do documento
        }
        if (years[1] != '...') {  // Testa se o ano final não é vazio
          int end = int.parse(years[1]);  // Converte o ano final em inteiro
          if (yearInt > end) continue;  // Testa se o ano final da busca é menor que a do documento
        }
      }
      query[doc.id] = doc.data();
    }
    log(query.length.toString());
    return query;
  }
}
