import 'package:busca_peca/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

LoginController controller = Get.find();

textStyleFormField(double height) {
  return TextStyle(
    color: Colors.white,
    fontSize: height * 0.03,
  );
}

inputDecorationFormField(String text) {
  return InputDecoration(
    labelText: text,
    labelStyle: const TextStyle(color: Colors.grey),
  );
}

class TextFormFieldEmail extends StatelessWidget {
  const TextFormFieldEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: controller.emailController.value,
      keyboardType: TextInputType.emailAddress,
      style: textStyleFormField(context.height),
      decoration: inputDecorationFormField('E-mail'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Digite o email';
        } else if (!RegExp(r'[a-z0-9.-_]+@[a-z0-9.-_]+').hasMatch(value)) {
          return 'Digite um email válido';
        }
        return 'erro';
      },
    );
  }
}

class TextFormFieldPassword extends StatelessWidget {
  const TextFormFieldPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.passwordController.value,
      keyboardType: TextInputType.text,
      style: textStyleFormField(context.height),
      decoration: inputDecorationFormField('Senha'),
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Digite a senha';
        } else if (value.length < 6) {
          return 'Deve ter ao menos 6 digitos';
        }
        return 'erro';
      },
    );
  }
}

class ElevatedButtonLogin extends StatelessWidget {
  const ElevatedButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (controller.formKey.value.currentState!.validate()) {
          controller.login();
        }
      },
      child: const Text('Login'),
    );
  }
}

checkLine(LoginController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      const Text('Lembrar de mim'),
      Obx(() => Checkbox(
          activeColor: Colors.blue,
          value: controller.rememberMe.value,
          onChanged: (value) {
            controller.rememberMe.value = value ?? controller.rememberMe.value;
          })),
    ],
  );
}
