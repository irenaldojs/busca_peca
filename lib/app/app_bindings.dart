import 'package:busca_peca/app/pages/catalog/catalog_controller.dart';
import 'package:busca_peca/app/pages/catalogData/catalog_data_controller.dart';
import 'package:busca_peca/app/pages/home/home_controller.dart';
import 'package:busca_peca/app/pages/login/login_controller.dart';
import 'package:busca_peca/app/pages/profile/profile_controller.dart';
import 'package:busca_peca/app/pages/register/register_controller.dart';
import 'package:busca_peca/app/repository/data_local_repository.dart';
import 'package:busca_peca/app/services/auth_service.dart';
import 'package:busca_peca/app/repository/data_repository.dart';
import 'package:get/instance_manager.dart';

class InitBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthService(), permanent: true);
  }
}

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}

class HomeBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.put(DataRepository(), permanent: true);
    Get.put(DataLocalRepository(), permanent: true);
  }
  
}

class ProfileBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
  
}

class CatalogBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CatalogController());
  }
}

class CatalogDataBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CatalogDataController());
  }

}
