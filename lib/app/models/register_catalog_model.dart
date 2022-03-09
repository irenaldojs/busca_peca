import 'dart:convert';

import 'package:flutter/foundation.dart';


class RegisterCatalog {
  
  String doc;
  Map<String, dynamic> data;

  RegisterCatalog({
    required this.doc,
    required this.data,
  });  

  RegisterCatalog copyWith({
    String? doc,
    Map<String, dynamic>? data,
  }) {
    return RegisterCatalog(
      doc: doc ?? this.doc,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'doc': doc,
      'data': data,
    };
  }

  factory RegisterCatalog.fromMap(Map<String, dynamic> map) {
    return RegisterCatalog(
      doc: map['doc'] ?? '',
      data: Map<String, dynamic>.from(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterCatalog.fromJson(String source) => RegisterCatalog.fromMap(json.decode(source));

  @override
  String toString() => 'RegisterCatalog(doc: $doc, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RegisterCatalog &&
      other.doc == doc &&
      mapEquals(other.data, data);
  }

  @override
  int get hashCode => doc.hashCode ^ data.hashCode;
} 
