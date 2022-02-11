import 'dart:developer';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends GetxController {
  AuthService() {
    _authCheck();
  }
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = true;
  User? localUser;

  _authCheck() async {
    await auth.authStateChanges().listen(
      (User? user) {
        localUser = (user == null) ? null : user;
        isLoading = false;
        log('Usuário: '+localUser!.email.toString());
      },
    );
  }

  register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      if (e.message == 'busca_peca') {
        throw AuthException('A senha é muito curta.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado.');
      }
    }
  }

  login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == 'weak-password') {
        throw AuthException('Email não encontrado.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente.');
      }
    }
  }

  _getUser() {
    localUser = auth.currentUser;
    log('Usuário: '+localUser!.email.toString());
  }
}
