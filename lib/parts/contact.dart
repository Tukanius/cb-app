part of '../models/contact.dart';

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    id: json['id'] != null ? json['id'] as String : null,
    phoneNumber:
        json['phoneNumber'] != null ? json['phoneNumber'] as String : null,
    email: json['email'] != null ? json['email'] as String : null,
    address: json['address'] != null ? json['address'] as String : null,
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) {
  Map<String, dynamic> json = {};
  if (instance.id != null) json['id'] = instance.id;
  if (instance.email != null) json['email'] = instance.email;
  if (instance.phoneNumber != null) json['phoneNumber'] = instance.phoneNumber;
  if (instance.address != null) json['address'] = instance.address;

  return json;
}
