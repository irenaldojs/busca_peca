import 'package:busca_peca/app/repository/data_local_repository.dart';
import 'package:busca_peca/app/repository/data_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  DataRepository data = Get.find();
  DataLocalRepository local = Get.find();

  searchOnChanged(){}
}
