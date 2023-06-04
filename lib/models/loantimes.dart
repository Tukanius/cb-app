part '../parts/loantimes.dart';

class Loantimes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  Loantimes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$LoantimesFromJson(json);

  factory Loantimes.fromJson(Map<String, dynamic> json) =>
      _$LoantimesFromJson(json);
  Map<String, dynamic> toJson() => $LoantimesToJson(this);
}
