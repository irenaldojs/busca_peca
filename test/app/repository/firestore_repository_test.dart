import 'dart:developer';

import 'package:busca_peca/app/repository/firestore_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await Firebase.initializeApp();
  final firestoreRepository = FirestoreRepository();

  test('Deve pegar a lista de catálogos', () async {
    log('até agora');
    final listCatalog = await firestoreRepository.catalogList();
    expect(listCatalog.isNotEmpty, equals(true));

  });
}