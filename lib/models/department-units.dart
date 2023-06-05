part '../parts/department-units.dart';

class DepartmentUnits {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  DepartmentUnits({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) =>
      _$DepartmentUnitsFromJson(json);

  factory DepartmentUnits.fromJson(Map<String, dynamic> json) =>
      _$DepartmentUnitsFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentUnitsToJson(this);
}
