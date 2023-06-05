part '../parts/day-calcs.dart';

class DayCalcs {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  DayCalcs({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$DayCalcsFromJson(json);

  factory DayCalcs.fromJson(Map<String, dynamic> json) =>
      _$DayCalcsFromJson(json);
  Map<String, dynamic> toJson() => _$DayCalcsToJson(this);
}
