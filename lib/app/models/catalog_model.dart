import 'dart:convert';

import 'package:flutter/foundation.dart';

class Catalog {
  String name;
  List<String> search;
  List<String> columns;
  int version;
  
  Catalog({
    required this.name,
    required this.search,
    required this.columns,
    required this.version,
  });


  Catalog copyWith({
    String? name,
    List<String>? search,
    List<String>? columns,
    int? version,
  }) {
    return Catalog(
      name: name ?? this.name,
      search: search ?? this.search,
      columns: columns ?? this.columns,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'search': search,
      'columns': columns,
      'version': version,
    };
  }

  factory Catalog.fromMap(Map<String, dynamic> map) {
    return Catalog(
      name: map['name'] ?? '',
      search: List<String>.from(map['search']),
      columns: List<String>.from(map['columns']),
      version: map['version']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Catalog.fromJson(String source) => Catalog.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Catalog(name: $name, search: $search, columns: $columns, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Catalog &&
      other.name == name &&
      listEquals(other.search, search) &&
      listEquals(other.columns, columns) &&
      other.version == version;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      search.hashCode ^
      columns.hashCode ^
      version.hashCode;
  }
}
