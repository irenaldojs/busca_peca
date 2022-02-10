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
        title: Text('Cadastro'),
      ),
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
                      children: [
                        textFormFieldFisrtName(
                            height, controller.firstNameController.value),
                        textFormFieldLastName(
                            height, controller.lastNameController.value),
                        textFormFieldEmail(
                            height, controller.emailController.value),
                        textFormFieldPhone(
                            height, controller.phoneController.value, controller),
                        textFormFieldPassword(
                            height, controller.passwordController.value),
                        textFormFieldComparePassword(
                            height,
                            controller.comparePasswordController.value,
                            controller.passwordController.value)
                      ],
                    )),
                textButtomRegister(height, controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
