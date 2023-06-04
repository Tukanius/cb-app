part of '../models/customer_related_person.dart';

CustomerRelated _$CustomerRelatedFromJson(Map<String, dynamic> json) {
  return CustomerRelated(
    customerId:
        json['customerId'] != null ? json['customerId'] as String : null,
    whoTypeId: json['whoTypeId'] != null ? json['whoTypeId'] as String : null,
    firstName: json['firstName'] != null ? json['firstName'] as String : null,
    lastName: json['lastName'] != null ? json['lastName'] as String : null,
    phone: json['phone'] != null ? json['phone'] as String : null,
  );
}

Map<String, dynamic> $CustomerRelatedToJson(CustomerRelated instance) {
  Map<String, dynamic> json = {};

  if (instance.customerId != null) json['customerId'] = instance.customerId;
  if (instance.whoTypeId != null) json['whoTypeId'] = instance.whoTypeId;
  if (instance.firstName != null) json['firstName'] = instance.firstName;
  if (instance.lastName != null) json['lastName'] = instance.lastName;
  if (instance.phone != null) json['phone'] = instance.phone;

  return json;
}
