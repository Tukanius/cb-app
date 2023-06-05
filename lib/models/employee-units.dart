part '../parts/employee-units.dart';

class EmployeeUnits {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? departmentUnitId;

  EmployeeUnits({
    this.departmentUnitId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$EmployeeUnitsFromJson(json);

  factory EmployeeUnits.fromJson(Map<String, dynamic> json) =>
      _$EmployeeUnitsFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeUnitsToJson(this);
}
