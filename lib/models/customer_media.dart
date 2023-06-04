part '../parts/customer_media.dart';

class CustomerMedia {
  String? customerId;
  String? name;
  String? url;

  CustomerMedia({
    this.customerId,
    this.name,
    this.url,
  });

  static $fromJson(Map<String, dynamic> json) => _$CustomerMediaFromJson(json);

  factory CustomerMedia.fromJson(Map<String, dynamic> json) =>
      _$CustomerMediaFromJson(json);
  Map<String, dynamic> toJson() => $CustomerMediaToJson(this);
}
