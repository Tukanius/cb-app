part '../parts/genders.dart';

class Genders {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  Genders({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$GendersFromJson(json);

  factory Genders.fromJson(Map<String, dynamic> json) =>
      _$GendersFromJson(json);
  Map<String, dynamic> toJson() => _$GendersToJson(this);
}
