import 'package:busca_peca/app/pages/login/login_controller.dart';
import 'package:busca_peca/app/pages/login/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [textFormFieldEmail(controller.emailController.value)],
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
