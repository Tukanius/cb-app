part '../parts/education-types.dart';

class EducationTypes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  EducationTypes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$EducationTypesFromJson(json);

  factory EducationTypes.fromJson(Map<String, dynamic> json) =>
      _$EducationTypesFromJson(json);
  Map<String, dynamic> toJson() => _$EducationTypesToJson(this);
}
