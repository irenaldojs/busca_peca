import 'dart:developer';
import 'package:get/get.dart';
import 'package:localstore/localstore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'data_repository.dart';

class DataLocalRepository extends GetxController {
  DataRepository _cloudDb = Get.find();

  final _localDb = Localstore.instance;

  Future<Map<String, dynamic>> returnCatalogsList() async {
    final _collection = await _cloudDb.listCatalogs();
    var _catalogsList = await _localDb.collection('catalogos').get();

    if (_catalogsList == null || _catalogsList == {}) {
      if (_catalogsList != null) {
        _catalogsList.clear();
      } else {
        _catalogsList = <String, dynamic>{};
      }
      _collection.forEach((key, value) {
        _catalogsList![key] = value;
      });
      for (var doc in _catalogsList.keys) {
        await _localDb.collection('catalogos').doc(doc).set(_catalogsList[doc]);
        log('chamou');
      }
    } else {
      for (var doc in _catalogsList.keys) {
        var localVersion =
            await _localDb.collection('catalogos').doc(doc).get().then((value) {
          return value!['version'];
        });
        var docString = doc.split('/')[2];
        var cloudVersion = _collection[docString]['version'];
        int localVersionInt = int.parse(localVersion.toString());
        int cloudVersionInt = int.parse(cloudVersion.toString());
      }
    }
    return _catalogsList;
  }

  Future<Map<String, dynamic>> returnCatalogData(
      String collection, String version,
      {String? car, String? year}) async {
    Map<String, dynamic> data = <String, dynamic>{};
    String nameCollection = collection.split('/')[1];
    String nameDocument = collection.split('/')[2];
    final cloudCollection = await _cloudDb.returnCatalogData(collection);
    var document = await _localDb.collection(nameDocument).get();
    // Associando o documento
    if (document == null) {
      data = await updateCatalogData(collection, version);
    } else {
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

        int year_int = int.parse(year!);

        if (init != '...') {
          int init_int = int.parse(init);
          if (init_int > year_int) {
            test = true;
          }
        }
        if (end != '...') {
          int end_int = int.parse(end);
          if (end_int < year_int) {
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
    var newDocument = await _cloudDb.returnCatalogData(collection);

    String nameCollection = collection.split('/')[1];
    String nameDocument = collection.split('/')[2];

    newDocument.forEach((key, value) {
      _localDb.collection(nameDocument).doc(key).set(value);
    });

    return newDocument;
  }
}
