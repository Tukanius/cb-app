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
    isActive: json['isActive'] != null ? json['isActive'] as String : null,
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
    addressTypeId:
        json['addressTypeId'] != null ? json['addressTypeId'] as String : null,
    provinceId:
        json['provinceId'] != null ? json['provinceId'] as String : null,
    districtId:
        json['districtId'] != null ? json['districtId'] as String : null,
    khorooId: json['khorooId'] != null ? json['khorooId'] as String : null,
    address: json['address'] != null ? json['address'] as String : null,
    province: json['province'] != null
        ? Customer.fromJson(json['province'] as Map<String, dynamic>)
        : null,
    district: json['district'] != null
        ? Customer.fromJson(json['district'] as Map<String, dynamic>)
        : null,
    khoroo: json['khoroo'] != null
        ? Customer.fromJson(json['khoroo'] as Map<String, dynamic>)
        : null,
    addressType: json['addressType'] != null
        ? Customer.fromJson(json['addressType'] as Map<String, dynamic>)
        : null,
    totalPayAmount: json['totalPayAmount'] != null
        ? json['totalPayAmount'] as String
        : null,
    payDate: json['payDate'] != null ? json['payDate'] as String : null,
    loanStatusId:
        json['loanStatusId'] != null ? json['loanStatusId'] as String : null,
    loan: json['loan'] != null
        ? Customer.fromJson(json['loan'] as Map<String, dynamic>)
        : null,
    loanId: json['loanId'] != null ? json['loanId'] as String : null,
    loanResidual:
        json['loanResidual'] != null ? json['loanResidual'] as String : null,
    rateCalcDay:
        json['rateCalcDay'] != null ? json['rateCalcDay'] as String : null,
    rateAmount:
        json['rateAmount'] != null ? json['rateAmount'] as String : null,
    mainLoanPayAmount: json['mainLoanPayAmount'] != null
        ? json['mainLoanPayAmount'] as String
        : null,
    amount:
        json['amount'] != null ? double.parse(json['amount'].toString()) : null,
    paidDate: json['paidDate'] != null ? json['paidDate'] as String : null,
    payerUserId:
        json['payerUserId'] != null ? json['payerUserId'] as String : null,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) {
  Map<String, dynamic> json = {};

  if (instance.paidDate != null) json['paidDate'] = instance.paidDate;
  if (instance.payerUserId != null) json['payerUserId'] = instance.payerUserId;
  if (instance.amount != null) json['amount'] = instance.amount;
  if (instance.rateAmount != null) json['rateAmount'] = instance.rateAmount;
  if (instance.mainLoanPayAmount != null)
    json['mainLoanPayAmount'] = instance.mainLoanPayAmount;
  if (instance.loanId != null) json['loanId'] = instance.loanId;
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
  if (instance.addressTypeId != null)
    json['addressTypeId'] = instance.addressTypeId;
  if (instance.provinceId != null) json['provinceId'] = instance.provinceId;
  if (instance.districtId != null) json['districtId'] = instance.districtId;
  if (instance.khorooId != null) json['khorooId'] = instance.khorooId;
  if (instance.address != null) json['address'] = instance.address;
  if (instance.province != null) json['province'] = instance.province;
  if (instance.district != null) json['district'] = instance.district;
  if (instance.khoroo != null) json['khoroo'] = instance.khoroo;
  if (instance.addressType != null) json['addressType'] = instance.addressType;
  if (instance.loanResidual != null)
    json['loanResidual'] = instance.loanResidual;
  if (instance.rateCalcDay != null) json['rateCalcDay'] = instance.rateCalcDay;

  return json;
}
