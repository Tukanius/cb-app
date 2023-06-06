part of '../models/customer.dart';

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    count: json['count'] != null ? int.parse(json['count'].toString()) : null,
    rows: json['rows'] != null
        ? (json['rows'] as List).map((e) => Customer.fromJson(e)).toList()
        : null,
    id: json['id'] != null ? json['id'] as String : null,
    customerId:
        json['customerId'] != null ? json['customerId'] as String : null,
    whoTypeId: json['whoTypeId'] != null ? json['whoTypeId'] as String : null,
    firstName: json['firstName'] != null ? json['firstName'] as String : null,
    lastName: json['lastName'] != null ? json['lastName'] as String : null,
    phone: json['phone'] != null ? json['phone'] as String : null,
    isActive: json['isActive'] != null ? json['isActive'] as bool : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
    createdUserId:
        json['createdUserId'] != null ? json['createdUserId'] as String : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] as String : null,
    updatedUserId:
        json['updatedUserId'] != null ? json['updatedUserId'] as String : null,
    deletedAt: json['deletedAt'] != null ? json['deletedAt'] as String : null,
    whoType: json['whoType'] != null
        ? Customer.fromJson(json['whoType'] as Map<String, dynamic>)
        : null,
    name: json['name'] != null ? json['name'] as String : null,
    bankId: json['bankId'] != null ? json['bankId'] as String : null,
    accountNumber:
        json['accountNumber'] != null ? json['accountNumber'] as String : null,
    bank: json['bank'] != null
        ? Customer.fromJson(json['bank'] as Map<String, dynamic>)
        : null,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) {
  Map<String, dynamic> json = {};

  if (instance.bankId != null) json['bankId'] = instance.bankId;
  if (instance.accountNumber != null)
    json['accountNumber'] = instance.accountNumber;
  if (instance.bank != null) json['bank'] = instance.bank;
  if (instance.count != null) json['count'] = instance.count;
  if (instance.rows != null) json['rows'] = instance.rows;
  if (instance.id != null) json['id'] = instance.id;
  if (instance.customerId != null) json['customerId'] = instance.customerId;
  if (instance.whoTypeId != null) json['whoTypeId'] = instance.whoTypeId;
  if (instance.firstName != null) json['firstName'] = instance.firstName;
  if (instance.lastName != null) json['lastName'] = instance.lastName;
  if (instance.phone != null) json['phone'] = instance.phone;
  if (instance.isActive != null) json['isActive'] = instance.isActive;
  if (instance.createdAt != null) json['createdAt'] = instance.createdAt;
  if (instance.createdUserId != null)
    json['createdUserId'] = instance.createdUserId;
  if (instance.updatedAt != null) json['updatedAt'] = instance.updatedAt;
  if (instance.updatedUserId != null)
    json['updatedUserId'] = instance.updatedUserId;
  if (instance.deletedAt != null) json['deletedAt'] = instance.deletedAt;
  if (instance.whoType != null) json['whoType'] = instance.whoType;
  if (instance.name != null) json['name'] = instance.name;

  return json;
}
