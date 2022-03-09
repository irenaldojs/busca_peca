import 'dart:convert';

import 'package:flutter/foundation.dart';

class RegisterCatalog {
  String doc;
  List<Map<String, dynamic>> data;
  
  RegisterCatalog({
    required this.doc,
    required this.data,
  });

  RegisterCatalog copyWith({
    String? doc,
    List<Map<String, dynamic>>? data,
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

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'RegisterCatalog(doc: $doc, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RegisterCatalog &&
      other.doc == doc &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => doc.hashCode ^ data.hashCode;
} 
