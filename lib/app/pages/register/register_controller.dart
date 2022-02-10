
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  final formKey = GlobalKey<FormState>().obs;
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final comparePasswordController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final phoneFormat = 0.obs;
}