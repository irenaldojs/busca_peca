
import 'package:busca_peca/app/pages/login/login_controller.dart';
import 'package:get/instance_manager.dart';

class LoginBidings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}