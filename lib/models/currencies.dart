part '../parts/currencies.dart';

class Currencies {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  bool? isActive;

  Currencies({
    this.isActive,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$CurrenciesFromJson(json);

  factory Currencies.fromJson(Map<String, dynamic> json) =>
      _$CurrenciesFromJson(json);
  Map<String, dynamic> toJson() => _$CurrenciesToJson(this);
}
