
import 'dart:math';

import 'package:busca_peca/app/models/register_catalog_model.dart';
import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:busca_peca/app/repository/cloud_data_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository implements ICloudData{
  @override
  Future<RegisterCatalog> catalogData(String nameDocument, {String? car, String? year, bool? acd, bool? dh, bool? abs, bool? ta, bool? gnv}) {
    // TODO: implement catalogData
    throw UnimplementedError();
  }

  @override
  Future<List<Catalog>> catalogList() async {
    List<Catalog> listCatalog = [];
    try {
      var result =
          await FirebaseFirestore.instance.collection('catalogos').get();      
      for (var doc in result.docs) {
        final catalog = Catalog.fromMap(doc.data());
        listCatalog.add(catalog);
      }
    } catch (e) {
      throw Exception('Erro na conexão: '+ e.toString());
    }
    return listCatalog;
  }

}