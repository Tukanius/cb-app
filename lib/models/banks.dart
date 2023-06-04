part '../parts/banks.dart';

class Banks {
  String? id;
  String? createdAt;
  String? deletedAt;
  String? updatedAt;
  String? name;

  Banks({
    this.id,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$BanksFromJson(json);

  factory Banks.fromJson(Map<String, dynamic> json) => _$BanksFromJson(json);
  Map<String, dynamic> toJson() => $BanksToJson(this);
}
