part '../parts/loan-statuses.dart';

class LoanStatuses {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  LoanStatuses({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$LoanStatusesFromJson(json);

  factory LoanStatuses.fromJson(Map<String, dynamic> json) =>
      _$LoanStatusesFromJson(json);
  Map<String, dynamic> toJson() => _$LoanStatusesToJson(this);
}
