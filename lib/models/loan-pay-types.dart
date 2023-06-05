part '../parts/loan-pay-types.dart';

class LoanPayTypes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  LoanPayTypes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$LoanPayTypesFromJson(json);

  factory LoanPayTypes.fromJson(Map<String, dynamic> json) =>
      _$LoanPayTypesFromJson(json);
  Map<String, dynamic> toJson() => _$LoanPayTypesToJson(this);
}
