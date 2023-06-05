part '../parts/holiday-calcs.dart';

class HolidayCalcs {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  HolidayCalcs({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$HolidayCalcsFromJson(json);

  factory HolidayCalcs.fromJson(Map<String, dynamic> json) =>
      _$HolidayCalcsFromJson(json);
  Map<String, dynamic> toJson() => _$HolidayCalcsToJson(this);
}
