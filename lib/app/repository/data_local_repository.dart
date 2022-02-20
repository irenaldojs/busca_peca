import 'dart:developer';
import 'package:get/get.dart';
import 'package:localstore/localstore.dart';
import 'data_repository.dart';

class DataLocalRepository extends GetxController {
  DataRepository cloudDb = Get.find();

  final _localDb = Localstore.instance;

  Future<Map<String, dynamic>> returnCatalogsList() async {
    final _collection = await cloudDb.listCatalogs(); // carrega lista na nuvem
    var _catalogsList =
        await _localDb.collection('catalogos').get(); // carrega lista local

    if (_catalogsList == null || _catalogsList == {}) {
      // se a lista local for nula ou vazia
      if (_catalogsList != null) {
        // se vazia
        _catalogsList.clear(); // limpa lista
      } else {
        _catalogsList = <String, dynamic>{}; // instancia a lista
      }
      _collection.forEach((key, value) {
        // salva lista da nuvem na variável
        _catalogsList![key] = value;
      });

      for (var doc in _catalogsList.keys) {
        // salva lista local no localStore
        await _localDb.collection('catalogos').doc(doc).set(_catalogsList[doc]);
      }
    } else {
      // se houver uma lista

      for (var doc in _catalogsList.keys) {
        final localVersion =
            await _localDb.collection('catalogos').doc(doc).get().then((value) {
          return value!['version'];
        });
      }
    }
    return _catalogsList;
  }

  Future<Map<String, dynamic>> returnCatalogData(
      String collection, String version,
      {String? car, String? year}) async {
    Map<String, dynamic> data = <String, dynamic>{};
    String nameCollection = collection.split('/')[1]; // nome coleção
    String nameDocument = collection.split('/')[2]; // nome do documento
    int cloudVersion = await cloudDb.returnCloudVersion(nameDocument);
    int localVersion = int.parse(version);

    var document = await _localDb.collection(nameDocument).get();

    // Associando o documento
    if (document == null || cloudVersion > localVersion) {
      //log('nuvem');
      data = await updateCatalogData(collection, cloudVersion.toString());
    } else {
      //log('local, version: ' + localVersion.toString());
      data = document;
    }
    // Filtros
    if (car != null) {
      // Fitlro carro
      data.removeWhere(
          (key, value) => !value['carro'].toString().contains(car));
    }
    if (year != 'Todos') {
      data.removeWhere((key, value) {
        String init = value['ano'].toString().split('/')[0];
        String end = value['ano'].toString().split('/')[1];
        bool test = false;

        int yearInt = int.parse(year!);

        if (init != '...') {
          int initInt = int.parse(init);
          if (initInt > yearInt) {
            test = true;
          }
        }
        if (end != '...') {
          int endInt = int.parse(end);
          if (endInt < yearInt) {
            test = true;
          }
        }
        return test;
      });
    }

    return data;
  }

  Future<Map<String, dynamic>> updateCatalogData(
      String collection, String version) async {
    var newDocument = await cloudDb.returnCatalogData(collection);

    String nameCollection = collection.split('/')[1];
    String nameDocument = collection.split('/')[2];

    newDocument.forEach((key, value) {
      _localDb.collection(nameDocument).doc(key).set(value);
    });
    var localDocument = await _localDb.collection(nameCollection).doc(nameDocument).get();
    localDocument!['version'] = version;
    await _localDb.collection(nameCollection).doc(nameDocument).set(localDocument);

    return newDocument;
  }
}
