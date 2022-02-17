import 'dart:developer';
import 'package:get/get.dart';
import 'package:localstore/localstore.dart';
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
        /*
        if (localVersionInt != cloudVersionInt) {
          var update = await returnCatalogData(docString);
          _localDb.collection('catalogos').doc(docString).set(update);
          log(update.toString());
        }
        */
      }
    }
    return _catalogsList;
  }

  Future<Map<String, dynamic>> returnCatalogData(String collection) async {
    Map<String, dynamic> data = <String, dynamic>{};
    final cloudCollection = await _cloudDb.returnCatalogData(collection);
    String nameDocument = collection.split('/')[2];
    var document = await _localDb.collection(nameDocument).get();
    if (document == null) {
      var newDocument = await updateCatalogData(collection);
      log(newDocument.toString());
    }
    return data;
  }

  Future<Map<String, dynamic>> updateCatalogData(String collection) async {
    var newDocument = await _cloudDb.returnCatalogData(collection);

    String nameCollection = collection.split('/')[1];
    String nameDocument = collection.split('/')[2];

    newDocument.forEach((key, value) {
      _localDb.collection(nameDocument).doc(key).set(value);
    });

    return newDocument;
  }
}
