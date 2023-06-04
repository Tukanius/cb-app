part '../parts/orgtypes.dart';

class Orgtypes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  Orgtypes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$OrgtypesFromJson(json);

  factory Orgtypes.fromJson(Map<String, dynamic> json) =>
      _$OrgtypesFromJson(json);
  Map<String, dynamic> toJson() => $OrgtypesToJson(this);
}
