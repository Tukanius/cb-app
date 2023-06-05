part '../parts/khoroos.dart';

class Khoroos {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? districtId;

  Khoroos({
    this.districtId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$KhoroosFromJson(json);

  factory Khoroos.fromJson(Map<String, dynamic> json) =>
      _$KhoroosFromJson(json);
  Map<String, dynamic> toJson() => _$KhoroosToJson(this);
}
