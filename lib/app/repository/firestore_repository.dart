import 'package:busca_peca/app/models/register_catalog_model.dart';
import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:busca_peca/app/repository/data_filter.dart';
import 'package:busca_peca/app/repository/data_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository implements IData {
  @override
  Future<RegisterCatalog> catalogData(
    Catalog catalog) async {
    RegisterCatalog registerCatalog;
    try {
      var result =
          await FirebaseFirestore.instance.collection(catalog.name).get();
      List<Map<String, dynamic>> data = [];
      for (var doc in result.docs) {
        data.add(doc.data());
      }      
      registerCatalog = RegisterCatalog(doc: catalog.name, data: data);
    } catch (e) {
      throw Exception('Erro na conexão: ' + e.toString());
    }
    return registerCatalog;
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
      throw Exception('Erro na conexão: ' + e.toString());
    }
    return listCatalog;
  }  
}
