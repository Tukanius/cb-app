part of '../models/customer_account.dart';

CustomerAccount _$CustomerAccountFromJson(Map<String, dynamic> json) {
  return CustomerAccount(
    customerId: json['customerId'] != null ? json['customerId'] : null,
    isOriginal:
        json['isOriginal'] != null ? json['isOriginal'] as String : null,
    bankId: json['bankId'] != null ? json['bankId'] as String : null,
    accountNumber:
        json['accountNumber'] != null ? json['accountNumber'] as String : null,
  );
}

Map<String, dynamic> $CustomerAccountToJson(CustomerAccount instance) {
  Map<String, dynamic> json = {};

  if (instance.customerId != null) json['customerId'] = instance.customerId;
  if (instance.isOriginal != null) json['isOriginal'] = instance.isOriginal;
  if (instance.bankId != null) json['bankId'] = instance.bankId;
  if (instance.accountNumber != null)
    json['accountNumber'] = instance.accountNumber;

  return json;
}
