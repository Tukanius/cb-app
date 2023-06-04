part of '../models/customer_address.dart';

CustomerAddress _$CustomerAddressFromJson(Map<String, dynamic> json) {
  return CustomerAddress(
    customerId: json['customerId'] != null ? json['customerId'] : null,
    addressType:
        json['addressType'] != null ? json['addressType'] as String : null,
    provinceId:
        json['provinceId'] != null ? json['provinceId'] as String : null,
    districtId:
        json['districtId'] != null ? json['districtId'] as String : null,
    khorooId: json['khorooId'] != null ? json['khorooId'] : null,
    address: json['address'] != null ? json['address'] : null,
  );
}

Map<String, dynamic> $CustomerAddressToJson(CustomerAddress instance) {
  Map<String, dynamic> json = {};

  if (instance.customerId != null) json['customerId'] = instance.customerId;
  if (instance.addressType != null) json['addressType'] = instance.addressType;
  if (instance.provinceId != null) json['provinceId'] = instance.provinceId;
  if (instance.districtId != null) json['districtId'] = instance.districtId;
  if (instance.khorooId != null) json['khorooId'] = instance.khorooId;
  if (instance.address != null) json['address'] = instance.address;

  return json;
}
