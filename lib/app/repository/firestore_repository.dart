import 'package:busca_peca/app/models/register_catalog_model.dart';
import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:busca_peca/app/repository/data_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository implements IData {
  @override
  Future<RegisterCatalog> catalogData(
    Catalog catalog, {
    String? car,
    String? year,
    String? ccMotor,
    bool? acd,
    bool? dh,
    bool? gnv,
    bool? abs,
    bool? ta,
  }) async {
    RegisterCatalog registerCatalog;
    try {
      var result =
          await FirebaseFirestore.instance.collection(catalog.name).get();
      List<Map<String, dynamic>> data = [];
      for (var doc in result.docs) {
        data.add(doc.data());
      }
      List<Map<String, dynamic>> dataFilter = catalogDataFilter(data,
          car: car,
          year: year,
          ccMotor: ccMotor,
          acd: acd,
          dh: dh,
          gnv: gnv,
          abs: abs,
          ta: ta);
      registerCatalog = RegisterCatalog(doc: catalog.name, data: dataFilter);
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

  List<Map<String, dynamic>> catalogDataFilter(
    List<Map<String, dynamic>> data, {
    String? car,
    String? year,
    String? ccMotor,
    bool? acd,
    bool? dh,
    bool? gnv,
    bool? abs,
    bool? ta,
  }) {
    List<Map<String, dynamic>> dataFilter = data;

    // Filtro de carro
    if (car != null && car != '') {
      dataFilter.removeWhere((element) =>
          !element['carro'].toString().contains(car.toLowerCase()));
    }
    // Filtro de ano
    if (year != null && year != 'Todos') {
      dataFilter.removeWhere((element) {
        if (element['ano'] == null) return false;

        final yearElement = element['ano'].toString().split('/');
        int convertYear = int.parse(year);

        if (yearElement[0] != '...') {
          int initYear = int.parse(yearElement[0]);
          if (initYear > convertYear) return true;
        }
        if (yearElement[1] != '...') {
          int endYear = int.parse(yearElement[1]);
          if (endYear < convertYear) return true;
        }
        return false;
      });
    }
    return dataFilter;
  }
}
