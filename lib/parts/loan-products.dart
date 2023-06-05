part of '../models/loan-products.dart';

LoanProducts _$LoanProductsFromJson(Map<String, dynamic> json) {
  return LoanProducts(
    id: json['id'] != null ? json['id'] as String : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] as String : null,
    deletedAt: json['deletedAt'] != null ? json['deletedAt'] as String : null,
    name: json['name'] != null ? json['name'] as String : null,
    isActive: json['isActive'] != null ? json['isActive'] as bool : null,
    createdBy: json['createdBy'] != null ? json['createdBy'] as String : null,
    updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : null,
    startDate: json['startDate'] != null ? json['startDate'] as String : null,
    endDate: json['endDate'] != null ? json['endDate'] as String : null,
    currencyId:
        json['currencyId'] != null ? json['currencyId'] as String : null,
    dayCalcId: json['dayCalcId'] != null ? json['dayCalcId'] as String : null,
    loanCategoryId: json['loanCategoryId'] != null
        ? json['loanCategoryId'] as String
        : null,
    isMobile: json['isMobile'] != null ? json['isMobile'] as bool : null,
    isPayFirstOffBal: json['isPayFirstOffBal'] != null
        ? json['isPayFirstOffBal'] as bool
        : null,
    productId: json['productId'] != null ? json['productId'] as String : null,
    rateTypeId:
        json['rateTypeId'] != null ? json['rateTypeId'] as String : null,
  );
}

Map<String, dynamic> _$LoanProductsToJson(LoanProducts instance) {
  Map<String, dynamic> json = {};
  if (instance.isActive != null) json['isActive'] = instance.isActive;
  if (instance.createdBy != null) json['createdBy'] = instance.createdBy;
  if (instance.updatedBy != null) json['updatedBy'] = instance.updatedBy;
  if (instance.startDate != null) json['startDate'] = instance.startDate;
  if (instance.endDate != null) json['endDate'] = instance.endDate;
  if (instance.currencyId != null) json['currencyId'] = instance.currencyId;
  if (instance.dayCalcId != null) json['dayCalcId'] = instance.dayCalcId;
  if (instance.loanCategoryId != null)
    json['loanCategoryId'] = instance.loanCategoryId;
  if (instance.isMobile != null) json['isMobile'] = instance.isMobile;
  if (instance.isPayFirstOffBal != null)
    json['isPayFirstOffBal'] = instance.isPayFirstOffBal;
  if (instance.productId != null) json['productId'] = instance.productId;
  if (instance.rateTypeId != null) json['rateTypeId'] = instance.rateTypeId;
  if (instance.id != null) json['id'] = instance.id;
  if (instance.createdAt != null) json['createdAt'] = instance.createdAt;
  if (instance.updatedAt != null) json['updatedAt'] = instance.updatedAt;
  if (instance.deletedAt != null) json['deletedAt'] = instance.deletedAt;
  if (instance.name != null) json['name'] = instance.name;

  return json;
}
