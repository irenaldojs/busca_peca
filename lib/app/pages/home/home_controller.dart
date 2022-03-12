import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:busca_peca/app/repository/data_controller.dart';
import 'package:busca_peca/app/repository/data_local_repository.dart';
import 'package:busca_peca/app/repository/data_repository.dart';
import 'package:busca_peca/app/repository/firestore_repository.dart';
import 'package:get/get.dart';

import '../../repository/data_interface.dart';

class HomeController extends GetxController {
  
  DataController dataController = Get.find();
  IData catalogsRepository = FirestoreRepository();
  
  List<Catalog> catalogs = [];

  Future<List<Catalog>> SearchCatalogs () async {
    catalogs = await catalogsRepository.catalogList();
    return catalogs;
  }

  selectCatalog(Catalog catalog) async {
    dataController.catalog = catalog;
    dataController.registerCatalog = await catalogsRepository.catalogData(catalog);
  }
  searchOnChanged(){}

}
