import 'dart:convert';

import 'package:flutter/foundation.dart';



class CatalogDataModel {
  List<Map<String, dynamic>> item;
  CatalogDataModel({
    required this.item,
  });


  CatalogDataModel copyWith({
    List<Map<String, dynamic>>? item,
  }) {
    return CatalogDataModel(
      item: item ?? this.item,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item': item,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CatalogDataModel(item: $item)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CatalogDataModel &&
      listEquals(other.item, item);
  }

  @override
  int get hashCode => item.hashCode;
}
