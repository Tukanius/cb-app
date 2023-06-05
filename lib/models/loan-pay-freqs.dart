part '../parts/loan-pay-freqs.dart';

class LoanPayFreqs {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  LoanPayFreqs({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$LoanPayFreqsFromJson(json);

  factory LoanPayFreqs.fromJson(Map<String, dynamic> json) =>
      _$LoanPayFreqsFromJson(json);
  Map<String, dynamic> toJson() => _$LoanPayFreqsToJson(this);
}
