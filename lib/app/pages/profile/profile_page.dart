import 'package:busca_peca/app/pages/profile/profile_controller.dart';
import 'package:busca_peca/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Perfil')),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () async {
          AuthService auth = Get.find();
          await auth.auth.signOut();
          Get.offAllNamed('/login');
        },
        child: const Text('Logout'),
      )),
    );
  }
}
