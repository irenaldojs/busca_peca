import 'dart:convert';

import 'package:flutter/foundation.dart';


class Catalogo {
  String item;
  List<String> pesquisa;
  List<String> colunas;
  Catalogo({
    required this.item,
    required this.pesquisa,
    required this.colunas,
  });

  Catalogo copyWith({
    String? item,
    List<String>? pesquisa,
    List<String>? colunas,
  }) {
    return Catalogo(
      item: item ?? this.item,
      pesquisa: pesquisa ?? this.pesquisa,
      colunas: colunas ?? this.colunas,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item': item,
      'pesquisa': pesquisa,
      'colunas': colunas,
    };
  }

  factory Catalogo.fromMap(Map<String, dynamic> map) {
    return Catalogo(
      item: map['item'] ?? '',
      pesquisa: List<String>.from(map['pesquisa']),
      colunas: List<String>.from(map['colunas']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Catalogo.fromJson(String source) => Catalogo.fromMap(json.decode(source));

  @override
  String toString() => 'Catalogo(item: $item, pesquisa: $pesquisa, colunas: $colunas)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Catalogo &&
      other.item == item &&
      listEquals(other.pesquisa, pesquisa) &&
      listEquals(other.colunas, colunas);
  }

  @override
  int get hashCode => item.hashCode ^ pesquisa.hashCode ^ colunas.hashCode;
}
