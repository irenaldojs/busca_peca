import 'dart:convert';

class Catalog{
  String item;
  List<String> pesquisa;
  List<String> colunas;

   Catalog({
    required this.item,
    required this.pesquisa,
    required this.colunas
  });

  Catalog copyWith({
    String? email,
    String? password,
  }) {
    return Catalog(
      item: item,
      pesquisa: pesquisa,
      colunas: colunas,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item': item,
      'pesquisa': pesquisa,
      'colunas' : colunas
    };
  }

  factory Catalog.fromMap(Map<String, dynamic> map) {
    return Catalog(
      item: map['item'] ?? '',
      pesquisa: map['pesquisa'] ?? '',
      colunas: map['colunas'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Catalog.fromJson(String source) => Catalog.fromMap(json.decode(source));

  @override
  String toString() => 'Catalog(item: $item, pesquisa: $pesquisa, colunas: $colunas)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Catalog &&
      other.item == item &&
      other.pesquisa == pesquisa &&
      other.colunas == colunas;
  }

  @override
  int get hashCode => item.hashCode ^ pesquisa.hashCode ^colunas.hashCode;

}