// To parse this JSON data, do
//
//     final productCategory = productCategoryFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ProductCategory {
  ProductCategory({
    @required this.categoryId,
    @required this.categoryName,
    @required this.categoryDesc,
    @required this.categoryPictureUrl,
    @required this.categoryTags,
  });

  final int categoryId;
  final String categoryName;
  final CategoryDesc categoryDesc;
  final String categoryPictureUrl;
  final String categoryTags;

  factory ProductCategory.fromJson(String str) => ProductCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductCategory.fromMap(Map<String, dynamic> json) => ProductCategory(
    categoryId: json["categoryID"],
    categoryName: json["categoryName"],
    categoryDesc: categoryDescValues.map[json["categoryDesc"]],
    categoryPictureUrl: json["categoryPictureUrl"],
    categoryTags: json["categoryTags"],
  );

  Map<String, dynamic> toMap() => {
    "categoryID": categoryId,
    "categoryName": categoryName,
    "categoryDesc": categoryDescValues.reverse[categoryDesc],
    "categoryPictureUrl": categoryPictureUrl,
    "categoryTags": categoryTags,
  };
}

enum CategoryDesc { TASTIEST_FOODS_ARE_LISTED_IN_THIS_CATEGORY }

final categoryDescValues = EnumValues({
  "Tastiest Foods are listed in this category": CategoryDesc.TASTIEST_FOODS_ARE_LISTED_IN_THIS_CATEGORY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}