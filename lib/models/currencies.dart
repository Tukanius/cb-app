part '../parts/currencies.dart';

class Currencies {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? isActive;

  Currencies({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
    this.isActive,
  });

  static $fromJson(Map<String, dynamic> json) => _$CurrenciesFromJson(json);

  factory Currencies.fromJson(Map<String, dynamic> json) =>
      _$CurrenciesFromJson(json);
  Map<String, dynamic> toJson() => $CurrenciesToJson(this);
}
