part '../parts/org-types.dart';

class OrgTypes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  OrgTypes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$OrgTypesFromJson(json);

  factory OrgTypes.fromJson(Map<String, dynamic> json) =>
      _$OrgTypesFromJson(json);
  Map<String, dynamic> toJson() => _$OrgTypesToJson(this);
}
