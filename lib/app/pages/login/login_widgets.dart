import 'package:flutter/material.dart';

textFormFieldEmail(TextEditingController controller) {
  return TextFormField(    
    controller: controller,
    decoration: InputDecoration(
      icon: const Icon(Icons.email),
      fillColor: Colors.white,
      filled: true,
      hintText: 'Digire seu email.',
      hintStyle:  const TextStyle(color: Colors.grey),
    ),    
  );
}
