
import 'package:busca_peca/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  final formKey = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final comparePasswordController = TextEditingController().obs;

   AuthService auth = Get.find();

  register() async {
    try{
      await auth.register(emailController.value.text, passwordController.value.text);
      Get.offAllNamed('/');
      
    }on AuthException catch (e){
      Get.snackbar( 'Falha no cadastro', e.message);
    }
  }
}