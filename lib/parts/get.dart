part of '../models/get.dart';

Get _$GetFromJson(Map<String, dynamic> json) {
  return Get(
    id: json['id'] != null ? json['id'] as String : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] as String : null,
    deletedAt: json['deletedAt'] != null ? json['deletedAt'] as String : null,
    name: json['name'] != null ? json['name'] as String : null,
    accountNumber:
        json['accountNumber'] != null ? json['accountNumber'] as String : null,
    balance: json['balance'] != null ? json['balance'] as String : null,
    scoreAmount:
        json['scoreAmount'] != null ? json['scoreAmount'] as String : null,
    loanAmount:
        json['loanAmount'] != null ? json['loanAmount'] as String : null,
    isActive: json['isActive'] != null ? json['isActive'] as bool : null,
    customerId:
        json['customerId'] != null ? json['customerId'] as String : null,
  );
}

Map<String, dynamic> _$GetToJson(Get instance) {
  Map<String, dynamic> json = {};
  if (instance.id != null) json['id'] = instance.id;
  if (instance.createdAt != null) json['createdAt'] = instance.createdAt;
  if (instance.updatedAt != null) json['updatedAt'] = instance.updatedAt;
  if (instance.deletedAt != null) json['deletedAt'] = instance.deletedAt;
  if (instance.name != null) json['name'] = instance.name;
  if (instance.accountNumber != null)
    json['accountNumber'] = instance.accountNumber;
  if (instance.balance != null) json['balance'] = instance.balance;
  if (instance.scoreAmount != null) json['scoreAmount'] = instance.scoreAmount;
  if (instance.loanAmount != null) json['loanAmount'] = instance.loanAmount;
  if (instance.isActive != null) json['isActive'] = instance.isActive;
  if (instance.customerId != null) json['customerId'] = instance.customerId;

  return json;
}
