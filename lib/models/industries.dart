part '../parts/industries.dart';

class Industries {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  Industries({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$IndustriesFromJson(json);

  factory Industries.fromJson(Map<String, dynamic> json) =>
      _$IndustriesFromJson(json);
  Map<String, dynamic> toJson() => $IndustriesToJson(this);
}
