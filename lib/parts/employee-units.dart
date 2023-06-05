part of '../models/employee-units.dart';

EmployeeUnits _$EmployeeUnitsFromJson(Map<String, dynamic> json) {
  return EmployeeUnits(
    id: json['id'] != null ? json['id'] as String : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] as String : null,
    deletedAt: json['deletedAt'] != null ? json['deletedAt'] as String : null,
    name: json['name'] != null ? json['name'] as String : null,
    departmentUnitId: json['departmentUnitId'] != null
        ? json['departmentUnitId'] as String
        : null,
  );
}

Map<String, dynamic> _$EmployeeUnitsToJson(EmployeeUnits instance) {
  Map<String, dynamic> json = {};
  if (instance.departmentUnitId != null)
    json['departmentUnitId'] = instance.departmentUnitId;
  if (instance.id != null) json['id'] = instance.id;
  if (instance.createdAt != null) json['createdAt'] = instance.createdAt;
  if (instance.updatedAt != null) json['updatedAt'] = instance.updatedAt;
  if (instance.deletedAt != null) json['deletedAt'] = instance.deletedAt;
  if (instance.name != null) json['name'] = instance.name;

  return json;
}
