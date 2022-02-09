import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

textFormFieldEmail(TextEditingController editController) {
  return TextFormField(
    autofocus: true,
    controller: editController,
    keyboardType: TextInputType.emailAddress,
    style: const TextStyle(color: Colors.blue),
    decoration: const InputDecoration(        
        icon: Icon(Icons.email),
        fillColor: Colors.white,
        filled: true,
        hintText: 'Digite seu email.',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)))),
        validator: (value){
          if(value!.isEmpty || !RegExp(r'[a-z0-9.-_]+@[a-z0-9.-_]+').hasMatch(value)){
            return 'Digite um email válido';
          }else{
            return null;
          }
        },
  );
}

textFormFieldPassword(TextEditingController editController) {
  return TextFormField(
    controller: editController,
    keyboardType: TextInputType.text,    
    style: const TextStyle(color: Colors.blue),
    decoration: const InputDecoration(
      icon: Icon(Icons.password),
      fillColor: Colors.white,
      filled: true,
      hintText: 'Digite ssua senha.',
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)))),
      obscureText: true,
      validator: (value){
        if(value!.isEmpty){
          return 'Digite a senha';
        }else{
          return null;
        }
      }
  );
}
