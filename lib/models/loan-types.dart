part '../parts/loan-types.dart';

class LoanTypes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  bool? isActive;

  LoanTypes({
    this.isActive,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$LoanTypesFromJson(json);

  factory LoanTypes.fromJson(Map<String, dynamic> json) =>
      _$LoanTypesFromJson(json);
  Map<String, dynamic> toJson() => _$LoanTypesToJson(this);
}
