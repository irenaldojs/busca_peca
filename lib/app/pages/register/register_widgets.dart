import 'dart:developer';

import 'package:busca_peca/app/models/user_model.dart';
import 'package:busca_peca/app/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

textStyleFormField(double height) {
  return TextStyle(
    color: Colors.white,
    fontSize: height * 0.03,
  );
}

inputDecorationFormField(String text) {
  return InputDecoration(
    hintText: text,
    hintStyle: const TextStyle(color: Colors.grey),
  );
}

textFormFieldFisrtName(double height, TextEditingController editController) {
  return TextFormField(
    autofocus: true,
    controller: editController,
    keyboardType: TextInputType.text,
    style: textStyleFormField(height),
    textCapitalization: TextCapitalization.words,
    decoration: inputDecorationFormField('Nome'),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Nome obrigatório';
      } else {
        return null;
      }
    },
  );
}

textFormFieldLastName(double height, TextEditingController editController) {
  return TextFormField(
    autofocus: true,
    controller: editController,
    keyboardType: TextInputType.text,
    style: textStyleFormField(height),
    textCapitalization: TextCapitalization.words,
    decoration: inputDecorationFormField('Sobrenome'),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Sobrenome obrigatório';
      } else {
        return null;
      }
    },
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
      if (value!.isEmpty ||
          !RegExp(r'[a-z0-9.-_]+@[a-z0-9.-_]+').hasMatch(value)) {
        return 'Digite um email válido';
      } else {
        return null;
      }
    },
  );
}

textFormFieldPhone(double height, TextEditingController editController, RegisterController controller) {
  var mask = MaskTextInputFormatter(mask: '(##)# ####-####');
  return TextFormField(
    autofocus: true,
    controller: editController,
    keyboardType: TextInputType.number,
    style: textStyleFormField(height),
    inputFormatters: [mask],
    decoration: inputDecorationFormField('Telefone/Whatsapp'),
    validator: (value) {
      final regex = RegExp(r'[^\d]');
      final replaceValue = value?.replaceAll(regex, '').toString();
      if (value!.isEmpty ||
          !RegExp(r'^(\d){11}').hasMatch(replaceValue.toString())) {
        return 'Digite um telefone válido';
      } else {
        controller.phoneFormat.value = int.parse(replaceValue!);
        return null;
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
        return 'Digite uma senha';
      } else if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
        return 'Deve ter ao menos um número';
      } else if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
        return 'Deve ter ao menos uma letra minúscula';
      } else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
        return 'Deve ter ao menos uma letra maiúscula';
      } else if (!RegExp(r'^(?=.*[$*&@#])').hasMatch(value)) {
        return 'Deve ter ao menos um caractere especial';
      } else if (!RegExp(
              r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])[0-9a-zA-Z$*&@#]{8,}$')
          .hasMatch(value)) {
        return 'Deve ter ao menos 8 digitos';
      }
    },
  );
}

textFormFieldComparePassword(
    double height,
    TextEditingController compareEditController,
    TextEditingController passwordEditController) {
  return TextFormField(
    controller: compareEditController,
    keyboardType: TextInputType.text,
    style: textStyleFormField(height),
    decoration: inputDecorationFormField('Confirme a senha'),
    obscureText: true,
    validator: (value) {
      if (value != passwordEditController.text) {
        return 'Senha diferente';
      }
    },
  );
}

textButtomRegister(double height, RegisterController controller) {
  return TextButton(
    style: TextButton.styleFrom(backgroundColor: Colors.blue),
    onPressed: () {
      if (controller.formKey.value.currentState!.validate()) {
        final user = UserModel(
          fistName: controller.firstNameController.value.text,
          lastName: controller.lastNameController.value.text,
          email: controller.emailController.value.text,
          phone: controller.phoneFormat.value,
          password: controller.passwordController.value.text,
        );
        log(user.toString());
      }
    },
    child: Text(
      'Cadastrar',
      style: TextStyle(color: Colors.white, fontSize: height * 0.025),
    ),
  );
}
