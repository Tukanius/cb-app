part '../parts/work-status.dart';

class WorkStatus {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;

  WorkStatus({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$WorkStatusFromJson(json);

  factory WorkStatus.fromJson(Map<String, dynamic> json) =>
      _$WorkStatusFromJson(json);
  Map<String, dynamic> toJson() => _$WorkStatusToJson(this);
}
