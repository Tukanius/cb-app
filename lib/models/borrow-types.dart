part '../parts/borrow-types.dart';

class BorrowTypes {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  BorrowTypes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$BorrowTypesFromJson(json);

  factory BorrowTypes.fromJson(Map<String, dynamic> json) =>
      _$BorrowTypesFromJson(json);
  Map<String, dynamic> toJson() => _$BorrowTypesToJson(this);
}
