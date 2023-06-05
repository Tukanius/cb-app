part '../parts/districts.dart';

class Districts {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? provinceId;

  Districts({
    this.provinceId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$DistrictsFromJson(json);

  factory Districts.fromJson(Map<String, dynamic> json) =>
      _$DistrictsFromJson(json);
  Map<String, dynamic> toJson() => _$DistrictsToJson(this);
}
