import '../models/catalog_model.dart';
import '../models/register_catalog_model.dart';

abstract class ICloudData {
  Future<List<Catalog>> catalogList();

  Future<RegisterCatalog> catalogData(
    String nameDocument, {
    String? car,
    String? year,
    bool? acd,
    bool? dh,
    bool? abs,
    bool? ta,
    bool? gnv,
  });
      
}
