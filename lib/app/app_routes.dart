import 'package:busca_peca/app/pages/catalog/catalog_page.dart';
import 'package:busca_peca/app/pages/catalogData/catalog_data_page.dart';
import 'package:busca_peca/app/pages/init/init_page.dart';
import 'package:get/get.dart';
import 'app_bindings.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/register/register_page.dart';

class Routes {
  List<GetPage> getPages() {
    return [
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
      GetPage(
        name: '/catalog',
        page: () => const CatalogPage(),
        binding: CatalogBindings(),
      ),
      GetPage(
        name: '/catalogData',
        page: () => const CatalogDataPage(),
        binding: CatalogDataBinding(),
      ),
    ];
  }
}
