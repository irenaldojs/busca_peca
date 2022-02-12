import 'dart:convert';

class CatalogModel{
  String item;
  List<String> pesquisa;
  List<String> colunas;

   CatalogModel({
    required this.item,
    required this.pesquisa,
    required this.colunas
  });

  CatalogModel copyWith({
    String? email,
    String? password,
  }) {
    return CatalogModel(
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

  factory CatalogModel.fromMap(Map<String, dynamic> map) {
    return CatalogModel(
      item: map['item'] ?? '',
      pesquisa: map['pesquisa'] ?? '',
      colunas: map['colunas'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CatalogModel.fromJson(String source) => CatalogModel.fromMap(json.decode(source));

  @override
  String toString() => 'Catalog(item: $item, pesquisa: $pesquisa, colunas: $colunas)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CatalogModel &&
      other.item == item &&
      other.pesquisa == pesquisa &&
      other.colunas == colunas;
  }

  @override
  int get hashCode => item.hashCode ^ pesquisa.hashCode ^colunas.hashCode;

}