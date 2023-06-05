part '../parts/banks.dart';

class Banks {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  Banks({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$BanksFromJson(json);

  factory Banks.fromJson(Map<String, dynamic> json) => _$BanksFromJson(json);
  Map<String, dynamic> toJson() => _$BanksToJson(this);
}
