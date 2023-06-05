part '../parts/loan-products.dart';

class LoanProducts {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  bool? isActive;
  String? createdBy;
  String? updatedBy;
  String? startDate;
  String? endDate;
  String? currencyId;
  String? dayCalcId;
  String? loanCategoryId;
  bool? isMobile;
  bool? isPayFirstOffBal;
  String? productId;
  String? rateTypeId;

  LoanProducts({
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.startDate,
    this.endDate,
    this.currencyId,
    this.dayCalcId,
    this.loanCategoryId,
    this.isMobile,
    this.isPayFirstOffBal,
    this.productId,
    this.rateTypeId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$LoanProductsFromJson(json);

  factory LoanProducts.fromJson(Map<String, dynamic> json) =>
      _$LoanProductsFromJson(json);
  Map<String, dynamic> toJson() => _$LoanProductsToJson(this);
}
