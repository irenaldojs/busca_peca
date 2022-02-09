import 'package:busca_peca/app/pages/login/login_controller.dart';
import 'package:busca_peca/app/pages/login/login_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: controller.formKey.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      textFormFieldEmail(controller.emailController.value),
                      SizedBox(height: height * 0.01),
                      textFormFieldPassword(
                          controller.passwordController.value),
                      SizedBox(height: height * 0.01),
                      TextButton(                                   
                        onPressed: () {
                          if(controller.formKey.value.currentState!.validate()){}
                        },
                        child: const Text('Entrar'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
