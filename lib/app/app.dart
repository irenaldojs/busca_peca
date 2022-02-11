import 'package:busca_peca/app/app_bindings.dart';
import 'package:busca_peca/app/pages/home/home_page.dart';
import 'package:busca_peca/app/pages/init/init_page.dart';
import 'package:busca_peca/app/pages/login/login_page.dart';
import 'package:busca_peca/app/pages/profile/profile_page.dart';
import 'package:busca_peca/app/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const InitPage(),
          binding: InitBindings(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
          binding: LoginBindings(),
        ),
        GetPage(
          name: '/register',
          page: () => const RegisterPage(),
          binding: RegisterBindings(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: '/profile',
          page: () => const ProfilePage(),
          binding: ProfileBindings(),
        ),
      ],
    );
  }
}
