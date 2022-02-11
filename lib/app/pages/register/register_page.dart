import 'package:busca_peca/app/pages/register/register_controller.dart';
import 'package:busca_peca/app/pages/register/register_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Cadastro')),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width / 12, right: width / 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                  key: controller.formKey.value,
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.02),
                      textFormFieldEmail(
                          height, controller.emailController.value),
                      SizedBox(height: height * 0.02),
                      textFormFieldPassword(
                          height, controller.passwordController.value),
                      SizedBox(height: height * 0.02),
                      textFormFieldComparePassword(
                          height,
                          controller.comparePasswordController.value,
                          controller.passwordController.value)
                    ],
                  )),
              SizedBox(height: height * 0.02),
              elevatedButtonRegister(Get.mediaQuery.size, controller),
            ],
          ),
        ),
      ),
    );
  }
}
