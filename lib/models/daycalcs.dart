part '../parts/daycalcs.dart';

class Daycalcs {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  Daycalcs({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$DaycalcsFromJson(json);

  factory Daycalcs.fromJson(Map<String, dynamic> json) =>
      _$DaycalcsFromJson(json);
  Map<String, dynamic> toJson() => $DaycalcsToJson(this);
}
