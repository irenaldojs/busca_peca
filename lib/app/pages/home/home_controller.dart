import 'package:busca_peca/app/models/catalog_model.dart';
import 'package:busca_peca/app/repository/data_local_repository.dart';
import 'package:busca_peca/app/repository/data_repository.dart';
import 'package:busca_peca/app/repository/firestore_repository.dart';
import 'package:get/get.dart';

import '../../repository/cloud_data_interface.dart';

class HomeController extends GetxController {

  DataRepository data = Get.find();
  DataLocalRepository local = Get.find();
  ICloudData catalogsRepository = FirestoreRepository();

  List<Catalog> catalogs = [];

  Future<List<Catalog>> SearchCatalogs () async {
    catalogs = await catalogsRepository.catalogList();
    return catalogs;
  }

  searchOnChanged(){}

}
