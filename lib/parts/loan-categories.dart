part of '../models/loan-categories.dart';

LoanCategories _$LoanCategoriesFromJson(Map<String, dynamic> json) {
  return LoanCategories(
    id: json['id'] != null ? json['id'] as String : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] as String : null,
    deletedAt: json['deletedAt'] != null ? json['deletedAt'] as String : null,
    name: json['name'] != null ? json['name'] as String : null,
    isActive: json['isActive'] != null ? json['isActive'] as bool : null,
    parentId: json['parentId'] != null ? json['parentId'] as String : null,
  );
}

Map<String, dynamic> _$LoanCategoriesToJson(LoanCategories instance) {
  Map<String, dynamic> json = {};
  if (instance.isActive != null) json['isActive'] = instance.isActive;
  if (instance.parentId != null) json['parentId'] = instance.parentId;
  if (instance.id != null) json['id'] = instance.id;
  if (instance.createdAt != null) json['createdAt'] = instance.createdAt;
  if (instance.updatedAt != null) json['updatedAt'] = instance.updatedAt;
  if (instance.deletedAt != null) json['deletedAt'] = instance.deletedAt;
  if (instance.name != null) json['name'] = instance.name;

  return json;
}
