part '../parts/address-types.dart';

class AddressTypes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  AddressTypes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$AddressTypesFromJson(json);

  factory AddressTypes.fromJson(Map<String, dynamic> json) =>
      _$AddressTypesFromJson(json);
  Map<String, dynamic> toJson() => _$AddressTypesToJson(this);
}
