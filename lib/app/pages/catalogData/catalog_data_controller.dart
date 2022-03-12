import 'package:busca_peca/app/repository/data_controller.dart';
import 'package:get/get.dart';

class CatalogDataController extends GetxController {
  DataController dataController = Get.find();
  
  Future <List<Map<String, dynamic>>> registerDataFilter() async {
    List<Map<String, dynamic>> data = [];
    if(dataController.registerCatalogFilter != null){
      data = await dataController.registerCatalogFilter!.data;
    }else if(dataController.registerCatalog != null){
      data = await dataController.registerCatalog!.data;
    }
    return data;
  }
}
