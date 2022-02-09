import 'package:busca_peca/app/app_bindings.dart';
import 'package:busca_peca/app/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/login',
      getPages: [GetPage(name: '/login', page: () => const LoginPage(), binding: LoginBidings())],
    );
  }
}
