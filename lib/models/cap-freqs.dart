part '../parts/cap-freqs.dart';

class CapFreqs {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  CapFreqs({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$CapFreqsFromJson(json);

  factory CapFreqs.fromJson(Map<String, dynamic> json) =>
      _$CapFreqsFromJson(json);
  Map<String, dynamic> toJson() => _$CapFreqsToJson(this);
}
