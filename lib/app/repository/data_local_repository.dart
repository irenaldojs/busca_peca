import 'dart:developer';
import 'package:get/get.dart';
import 'package:localstore/localstore.dart';
import 'data_repository.dart';

class DataLocalRepository extends GetxController {
  DataRepository _cloudDb = Get.find();

  final _localDb = Localstore.instance;

  Future<Map<String, dynamic>> returnCatalogsList() async {
    final _db = Localstore.instance;
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
        await _db.collection('catalogos').doc(doc).set(_catalogsList[doc]);
        log('chamou');
      }
    } else {
      for (var doc in _catalogsList.keys) {
        var localVersion =
            await _db.collection('catalogos').doc(doc).get().then((value) {
          return value!['version'];
        });
        var docString = doc.split('/')[2];
        var cloudVersion = _collection[docString]['version'];
        int localVersionInt = int.parse(localVersion.toString());
        int cloudVersionInt = int.parse(cloudVersion.toString());

        if (localVersionInt == cloudVersionInt) {
          log('Versão local: ' +
              localVersion!.toString() +
              ' Versão Cloud: ' +
              cloudVersion.toString());
        }
      }
    }
    return _catalogsList;
  }

  Future<Map<String, dynamic>> returnCatalogData(String collection) async {
    Map<String, dynamic> data = <String, dynamic>{};
    final _db = Localstore.instance;
    final _collectionCloud = collection.split('/')[2];
    data = await _cloudDb.returnCatalogData(collection);
    return data;
  }
}
