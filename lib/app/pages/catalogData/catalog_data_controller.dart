import 'package:busca_peca/app/repository/data_controller.dart';
import 'package:busca_peca/app/repository/firestore_repository.dart';
import 'package:get/get.dart';

class CatalogDataController extends GetxController {
  DataController dataController = Get.find();

  Future<List<Map<String, dynamic>>> registerDataFilter() async {
    var repository = FirestoreRepository();
    dataController.registerCatalog ??=
        await repository.catalogData(dataController.catalog!);

    List<Map<String, dynamic>> data =
        dataController.registerCatalogFilter == null
            ? dataController.registerCatalog!.data
            : dataController.registerCatalogFilter!.data;

    data.sort((a, b) {
      if (a['montadora'].toString() != b['montadora']) {
        return a['montadora'].toString().compareTo(b['montadora'].toString());
      } else {
        return a['carro'].toString().compareTo(b['carro'].toString());
      }
    });

    return data;
  }
}
