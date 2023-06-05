part '../parts/rate-types.dart';

class RateTypes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  RateTypes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$RateTypesFromJson(json);

  factory RateTypes.fromJson(Map<String, dynamic> json) =>
      _$RateTypesFromJson(json);
  Map<String, dynamic> toJson() => _$RateTypesToJson(this);
}
