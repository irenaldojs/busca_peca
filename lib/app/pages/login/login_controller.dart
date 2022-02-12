import 'package:busca_peca/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  var rememberMe = false.obs;

  login() async {
    AuthService auth = Get.find();
    try {
      await auth.login(
          emailController.value.text, passwordController.value.text);
      if (auth.localUser != null) {
        Get.offNamed('/home');
      }
    } on AuthException catch (e) {
      Get.snackbar('Falha no login', e.message);
    }
  }
}
