import 'dart:async';
import 'dart:developer';

import 'package:busca_peca/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitPage extends GetView<AuthService> {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    check();
    return loading();
  }

  check() {
    Timer(const Duration(seconds: 1), () => route());
  }

  route() {
    if (controller.isLoading == false) {
      if (controller.localUser == null) {
        log('login');
        Get.offAllNamed('/login');
      } else {
        log('home');
        Get.offAllNamed('/home');
      }
    }
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
