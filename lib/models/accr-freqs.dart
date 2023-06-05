part '../parts/accr-freqs.dart';

class AccrFreqs {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  AccrFreqs({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$AccrFreqsFromJson(json);

  factory AccrFreqs.fromJson(Map<String, dynamic> json) =>
      _$AccrFreqsFromJson(json);
  Map<String, dynamic> toJson() => _$AccrFreqsToJson(this);
}
