import 'package:busca_peca/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

textFormFieldEmail(double height, TextEditingController editController) {
  return TextFormField(
    autofocus: true,
    controller: editController,
    keyboardType: TextInputType.emailAddress,
    style: textStyleFormField(height),
    decoration: inputDecorationFormField('E-mail'),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Digite o email';
      } else if (!RegExp(r'[a-z0-9.-_]+@[a-z0-9.-_]+').hasMatch(value)) {
        return 'Digite um email válido';
      }
    },
  );
}

textFormFieldPassword(double height, TextEditingController editController) {
  return TextFormField(
    controller: editController,
    keyboardType: TextInputType.text,
    style: textStyleFormField(height),
    decoration: inputDecorationFormField('Senha'),
    obscureText: true,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Digite a senha';
      } else if (value.length < 6) {
        return 'Deve ter ao menos 6 digitos';
      }
    },
  );
}

elevatedButtonLogin(Size size, LoginController controller) {
  return ElevatedButton(
    onPressed: () {
      if (controller.formKey.value.currentState!.validate()) {
        controller.login();
      }
    },
    child: const Text('Login'),
  );
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
