import 'package:busca_peca/app/pages/catalogData/catalog_data_controller.dart';
import 'package:busca_peca/app/pages/filter/filter_controller.dart';
import 'package:busca_peca/app/pages/home/home_controller.dart';
import 'package:busca_peca/app/pages/login/login_controller.dart';
import 'package:busca_peca/app/pages/profile/profile_controller.dart';
import 'package:busca_peca/app/pages/register/register_controller.dart';
import 'package:busca_peca/app/repository/data_controller.dart';
import 'package:busca_peca/app/services/auth_service.dart';
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
    Get.put(DataController(), permanent: true);
    Get.lazyPut(() => HomeController());    
  }
  
}

class ProfileBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
  
}
class FilterBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FilterController());
  }
}

class CatalogDataBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CatalogDataController());
  }

}
