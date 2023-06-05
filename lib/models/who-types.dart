part '../parts/who-types.dart';

class WhoTypes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  WhoTypes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$WhoTypesFromJson(json);

  factory WhoTypes.fromJson(Map<String, dynamic> json) =>
      _$WhoTypesFromJson(json);
  Map<String, dynamic> toJson() => _$WhoTypesToJson(this);
}
