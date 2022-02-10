import 'package:busca_peca/app/pages/login/login_controller.dart';
import 'package:busca_peca/app/pages/login/login_widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
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
        padding: EdgeInsets.only(left: width / 12, right: width / 12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  key: controller.formKey.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      textFormFieldEmail(
                          height, controller.emailController.value),
                      SizedBox(height: height * 0.02),
                      textFormFieldPassword(
                          height, controller.passwordController.value),
                      SizedBox(height: height * 0.02),
                      textButtomLogin(height, controller)
                    ],
                  ),
                ),
                checkLine(controller),
                SignInButton(
                        Buttons.Email,
                        text: 'Criar uma conta',
                        onPressed: (){}
                      ),
                SignInButton(
                  Buttons.Google,
                  text: 'Usar conta da gmail',
                  onPressed: () {},
                ),
                SignInButton(                  
                  Buttons.Facebook,
                  text: 'Usar conta facebook',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
