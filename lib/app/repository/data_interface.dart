import '../models/catalog_model.dart';
import '../models/register_catalog_model.dart';

abstract class IData {
  Future<List<Catalog>> catalogList();

  Future<RegisterCatalog> catalogData(
    Catalog catalog);
}
