part '../parts/whotype.dart';

class Whotype {
  String? id;
  String? createdAt;
  String? deletedAt;
  String? updatedAt;
  String? name;

  Whotype({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$WhotypeFromJson(json);

  factory Whotype.fromJson(Map<String, dynamic> json) =>
      _$WhotypeFromJson(json);
  Map<String, dynamic> toJson() => $WhotypeToJson(this);
}
