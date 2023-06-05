part '../parts/loan-times.dart';

class LoanTimes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? day;

  LoanTimes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
    this.day,
  });

  static $fromJson(Map<String, dynamic> json) => _$LoanTimesFromJson(json);

  factory LoanTimes.fromJson(Map<String, dynamic> json) =>
      _$LoanTimesFromJson(json);
  Map<String, dynamic> toJson() => _$LoanTimesToJson(this);
}
