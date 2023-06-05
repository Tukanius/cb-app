part '../parts/nationality-types.dart';

class NationalityTypes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  NationalityTypes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) =>
      _$NationalityTypesFromJson(json);

  factory NationalityTypes.fromJson(Map<String, dynamic> json) =>
      _$NationalityTypesFromJson(json);
  Map<String, dynamic> toJson() => _$NationalityTypesToJson(this);
}
