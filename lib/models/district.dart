part '../parts/district.dart';

class District {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? provinceId;
  String? name;

  District({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.provinceId,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$DistrictFromJson(json);

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
  Map<String, dynamic> toJson() => $DistrictToJson(this);
}
