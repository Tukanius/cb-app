part '../parts/province.dart';

class Province {
  String? id;
  String? createdAt;
  String? deletedAt;
  String? updatedAt;
  String? name;

  Province({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$ProvinceFromJson(json);

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);
  Map<String, dynamic> toJson() => $ProvinceToJson(this);
}
