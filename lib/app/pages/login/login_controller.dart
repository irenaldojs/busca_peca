
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final formKey = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  var rememberMe = false.obs;
}