part '../parts/loan-rate-types.dart';

class LoanRateTypes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  LoanRateTypes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$LoanRateTypesFromJson(json);

  factory LoanRateTypes.fromJson(Map<String, dynamic> json) =>
      _$LoanRateTypesFromJson(json);
  Map<String, dynamic> toJson() => _$LoanRateTypesToJson(this);
}
