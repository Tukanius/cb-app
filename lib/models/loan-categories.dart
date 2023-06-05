part '../parts/loan-categories.dart';

class LoanCategories {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  bool? isActive;
  String? parentId;

  LoanCategories({
    this.isActive,
    this.parentId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$LoanCategoriesFromJson(json);

  factory LoanCategories.fromJson(Map<String, dynamic> json) =>
      _$LoanCategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$LoanCategoriesToJson(this);
}
