import 'package:busca_peca/app/models/register_catalog_model.dart';
import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:localstore/localstore.dart';

class LocalRepository {
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
  }) {

    throw UnimplementedError();
  }

}
