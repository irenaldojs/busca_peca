import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

textFormFieldEmail(TextEditingController editController) {
  return TextFormField(
    autofocus: true,
    controller: editController,
    keyboardType: TextInputType.emailAddress,
    decoration: const InputDecoration(        
        icon: Icon(Icons.email),
        fillColor: Colors.white,
        filled: true,
        hintText: 'Digite seu email.',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)))),
  );
}

textFormFieldPassword(TextEditingController editController) {
  return TextFormField(
    controller: editController,
    keyboardType: TextInputType.text,
    decoration: const InputDecoration(
      icon: Icon(Icons.password),
      fillColor: Colors.white,
      filled: true,
      hintText: 'Digite ssua senha.',
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)))),    
  );
}
