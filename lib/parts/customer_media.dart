part of '../models/customer_media.dart';

CustomerMedia _$CustomerMediaFromJson(Map<String, dynamic> json) {
  return CustomerMedia(
    customerId:
        json['customerId'] != null ? json['customerId'] as String : null,
    name: json['name'] != null ? json['name'] as String : null,
    url: json['url'] != null ? json['url'] as String : null,
  );
}

Map<String, dynamic> $CustomerMediaToJson(CustomerMedia instance) {
  Map<String, dynamic> json = {};

  if (instance.customerId != null) json['customerId'] = instance.customerId;
  if (instance.name != null) json['name'] = instance.name;
  if (instance.url != null) json['url'] = instance.url;

  return json;
}
