part '../parts/calc-types.dart';

class CalcTypes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  CalcTypes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$CalcTypesFromJson(json);

  factory CalcTypes.fromJson(Map<String, dynamic> json) =>
      _$CalcTypesFromJson(json);
  Map<String, dynamic> toJson() => _$CalcTypesToJson(this);
}
