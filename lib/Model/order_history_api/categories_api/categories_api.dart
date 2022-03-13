import 'package:collection/collection.dart';

class CategoriesApi {
  String? categoryId;
  String? categoryName;
  dynamic categoryDetail;
  String? categoryImage;
  String? categoryCover;
  String? date;

  CategoriesApi({
    this.categoryId,
    this.categoryName,
    this.categoryDetail,
    this.categoryImage,
    this.categoryCover,
    this.date,
  });

  factory CategoriesApi.fromJson(Map<dynamic, dynamic> json) => CategoriesApi(
        categoryId: json['category_id'] as String?,
        categoryName: json['category_name'] as String?,
        categoryDetail: json['category_detail'] as dynamic,
        categoryImage: json['category_image'] as String?,
        categoryCover: json['category_cover'] as String?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'category_id': categoryId,
        'category_name': categoryName,
        'category_detail': categoryDetail,
        'category_image': categoryImage,
        'category_cover': categoryCover,
        'date': date,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CategoriesApi) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      categoryId.hashCode ^
      categoryName.hashCode ^
      categoryDetail.hashCode ^
      categoryImage.hashCode ^
      categoryCover.hashCode ^
      date.hashCode;
}
