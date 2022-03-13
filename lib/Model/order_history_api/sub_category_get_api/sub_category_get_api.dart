import 'package:collection/collection.dart';

class SubCategoryGetApi {
  String? subId;
  String? categoryId;
  String? subName;
  String? subDetail;
  String? subImage;
  String? date;

  SubCategoryGetApi({
    this.subId,
    this.categoryId,
    this.subName,
    this.subDetail,
    this.subImage,
    this.date,
  });

  factory SubCategoryGetApi.fromJson(Map<dynamic, dynamic> json) {
    return SubCategoryGetApi(
      subId: json['sub_id'] as String?,
      categoryId: json['category_id'] as String?,
      subName: json['sub_name'] as String?,
      subDetail: json['sub_detail'] as String?,
      subImage: json['sub_image'] as String?,
      date: json['date'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'sub_id': subId,
        'category_id': categoryId,
        'sub_name': subName,
        'sub_detail': subDetail,
        'sub_image': subImage,
        'date': date,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SubCategoryGetApi) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      subId.hashCode ^
      categoryId.hashCode ^
      subName.hashCode ^
      subDetail.hashCode ^
      subImage.hashCode ^
      date.hashCode;
}
