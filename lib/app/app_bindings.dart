
import 'package:busca_peca/app/pages/login/login_controller.dart';
import 'package:busca_peca/app/pages/register/register_controller.dart';
import 'package:get/instance_manager.dart';

class LoginBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class RegisterBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }

}