part '../parts/marriage-statuses.dart';

class MarriageStatuses {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  MarriageStatuses({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) =>
      _$MarriageStatusesFromJson(json);

  factory MarriageStatuses.fromJson(Map<String, dynamic> json) =>
      _$MarriageStatusesFromJson(json);
  Map<String, dynamic> toJson() => _$MarriageStatusesToJson(this);
}
