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
    // isActive: json['isActive'] != null ? json['isActive'] as bool : null,
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
    pay_date: json['pay_date'] != null ? json['pay_date'] as String : null,
    loanStatusId:
        json['loanStatusId'] != null ? json['loanStatusId'] as String : null,
    loanType: json['loanType'] != null
        ? Customer.fromJson(json['loanType'] as Map<String, dynamic>)
        : null,
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
    educationTypeId: json['educationTypeId'] != null
        ? json['educationTypeId'] as String
        : null,
    marriageStatusId: json['marriageStatusId'] != null
        ? json['marriageStatusId'] as String
        : null,
    familyCount: json['familyCount'] != null
        ? int.parse(json['familyCount'].toString())
        : null,
    incomeAmountMonth: json['incomeAmountMonth'] != null
        ? double.parse(json['incomeAmountMonth'].toString())
        : null,
    nationalityTypeId: json['nationalityTypeId'] != null
        ? json['nationalityTypeId'] as String
        : null,
    genderId: json['genderId'] != null ? json['genderId'] as String : null,
    birthPlace:
        json['birthPlace'] != null ? json['birthPlace'] as String : null,
    workStatusId:
        json['workStatusId'] != null ? json['workStatusId'] as String : null,
    loanRate: json['loanRate'] != null ? json['loanRate'] as String : null,

    familyName:
        json['familyName'] != null ? json['familyName'] as String : null,
    birthDate: json['birthDate'] != null ? json['birthDate'] as String : null,
    registerNo:
        json['registerNo'] != null ? json['registerNo'] as String : null,
    email: json['email'] != null ? json['email'] as String : null,
    signature: json['signature'] != null ? json['signature'] as String : null,
    avatar: json['avatar'] != null ? json['avatar'] as String : null,
    birthPlaceNote: json['birthPlaceNote'] != null
        ? json['birthPlaceNote'] as String
        : null,
    result: json['result'] != null
        ? Customer.fromJson(json['result'] as Map<String, dynamic>)
        : null,
    educationType: json['educationType'] != null
        ? Customer.fromJson(json['educationType'] as Map<String, dynamic>)
        : null,
    marriageStatus: json['marriageStatus'] != null
        ? Customer.fromJson(json['marriageStatus'] as Map<String, dynamic>)
        : null,
    nationalityType: json['nationalityType'] != null
        ? Customer.fromJson(json['nationalityType'] as Map<String, dynamic>)
        : null,
    gender: json['gender'] != null
        ? Customer.fromJson(json['gender'] as Map<String, dynamic>)
        : null,
    workStatus: json['workStatus'] != null
        ? Customer.fromJson(json['workStatus'] as Map<String, dynamic>)
        : null,
    total_pay_amount: json['total_pay_amount'] != null
        ? json['total_pay_amount'] as String
        : null,

    type: json['type'] != null ? json['type'] as String : null,
    transactionStatus: json['transactionStatus'] != null
        ? json['transactionStatus'] as String
        : null,
    paymentId: json['paymentId'] != null ? json['paymentId'] as String : null,
    paymentMethod:
        json['paymentMethod'] != null ? json['paymentMethod'] as String : null,
    creditAccountBank: json['creditAccountBank'] != null
        ? json['creditAccountBank'] as String
        : null,
    creditAccountId: json['creditAccountId'] != null
        ? json['creditAccountId'] as String
        : null,
    creditAccountNumber: json['creditAccountNumber'] != null
        ? json['creditAccountNumber'] as String
        : null,
    creditAccountCurrency: json['creditAccountCurrency'] != null
        ? json['creditAccountCurrency'] as String
        : null,
    creditAccountName: json['creditAccountName'] != null
        ? json['creditAccountName'] as String
        : null,
    debitAccountId: json['debitAccountId'] != null
        ? json['debitAccountId'] as String
        : null,
    debitAccountBank: json['debitAccountBank'] != null
        ? json['debitAccountBank'] as String
        : null,
    debitAccountNumber: json['debitAccountNumber'] != null
        ? json['debitAccountNumber'] as String
        : null,
    debitAccountName: json['debitAccountName'] != null
        ? json['debitAccountName'] as String
        : null,
    debitAccountCurrency: json['debitAccountCurrency'] != null
        ? json['debitAccountCurrency'] as String
        : null,
    description:
        json['description'] != null ? json['description'] as String : null,
    addInfo: json['addInfo'] != null ? json['addInfo'] as String : null,
    balance: json['balance'] != null ? json['balance'] as String : null,
    loanAmount:
        json['loanAmount'] != null ? json['loanAmount'] as String : null,
    loanProduct: json['loanProduct'] != null
        ? Customer.fromJson(json['loanProduct'] as Map<String, dynamic>)
        : null,

    maxRate: json['maxRate'] != null ? json['maxRate'] as String : null,
    loanProductRate: json['loanProductRate'] != null
        ? (json['loanProductRate'] as List)
            .map((e) => Customer.fromJson(e))
            .toList()
        : null,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) {
  Map<String, dynamic> json = {};

  if (instance.maxRate != null) json['maxRate'] = instance.maxRate;
  if (instance.loanProductRate != null)
    json['loanProductRate'] = instance.loanProductRate;
  if (instance.loanAmount != null) json['loanAmount'] = instance.loanAmount;
  if (instance.balance != null) json['balance'] = instance.balance;
  if (instance.loanProduct != null) json['loanProduct'] = instance.loanProduct;
  if (instance.type != null) json['type'] = instance.type;
  if (instance.transactionStatus != null)
    json['transactionStatus'] = instance.transactionStatus;
  if (instance.paymentId != null) json['paymentId'] = instance.paymentId;
  if (instance.paymentMethod != null)
    json['paymentMethod'] = instance.paymentMethod;
  if (instance.creditAccountBank != null)
    json['creditAccountBank'] = instance.creditAccountBank;
  if (instance.creditAccountId != null)
    json['creditAccountId'] = instance.creditAccountId;
  if (instance.creditAccountNumber != null)
    json['creditAccountNumber'] = instance.creditAccountNumber;
  if (instance.creditAccountCurrency != null)
    json['creditAccountCurrency'] = instance.creditAccountCurrency;
  if (instance.creditAccountName != null)
    json['creditAccountName'] = instance.creditAccountName;
  if (instance.debitAccountId != null)
    json['debitAccountId'] = instance.debitAccountId;
  if (instance.debitAccountBank != null)
    json['debitAccountBank'] = instance.debitAccountBank;
  if (instance.debitAccountNumber != null)
    json['debitAccountNumber'] = instance.debitAccountNumber;
  if (instance.debitAccountName != null)
    json['debitAccountName'] = instance.debitAccountName;
  if (instance.debitAccountCurrency != null)
    json['debitAccountCurrency'] = instance.debitAccountCurrency;
  if (instance.description != null) json['description'] = instance.description;
  if (instance.addInfo != null) json['addInfo'] = instance.addInfo;
  if (instance.pay_date != null) json['pay_date'] = instance.pay_date;
  if (instance.total_pay_amount != null)
    json['total_pay_amount'] = instance.total_pay_amount;
  if (instance.educationType != null)
    json['educationType'] = instance.educationType;
  if (instance.marriageStatus != null)
    json['marriageStatus'] = instance.marriageStatus;
  if (instance.nationalityType != null)
    json['nationalityType'] = instance.nationalityType;
  if (instance.gender != null) json['gender'] = instance.gender;
  if (instance.workStatus != null) json['workStatus'] = instance.workStatus;
  if (instance.result != null) json['result'] = instance.result;
  if (instance.loanRate != null) json['loanRate'] = instance.loanRate;
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
  if (instance.loanType != null) json['loanType'] = instance.loanType;
  if (instance.firstName != null) json['firstName'] = instance.firstName;
  if (instance.lastName != null) json['lastName'] = instance.lastName;
  if (instance.phone != null) json['phone'] = instance.phone;
  // if (instance.isActive != null) json['isActive'] = instance.isActive;
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
  if (instance.educationTypeId != null)
    json['educationTypeId'] = instance.educationTypeId;
  if (instance.marriageStatusId != null)
    json['marriageStatusId'] = instance.marriageStatusId;
  if (instance.familyCount != null) json['familyCount'] = instance.familyCount;
  if (instance.incomeAmountMonth != null)
    json['incomeAmountMonth'] = instance.incomeAmountMonth;
  if (instance.nationalityTypeId != null)
    json['nationalityTypeId'] = instance.nationalityTypeId;
  if (instance.genderId != null) json['genderId'] = instance.genderId;
  if (instance.birthPlace != null) json['birthPlace'] = instance.birthPlace;
  if (instance.workStatusId != null)
    json['workStatusId'] = instance.workStatusId;

  if (instance.familyName != null) json['familyName'] = instance.familyName;
  if (instance.birthDate != null) json['birthDate'] = instance.birthDate;
  if (instance.registerNo != null) json['registerNo'] = instance.registerNo;
  if (instance.email != null) json['email'] = instance.email;
  if (instance.signature != null) json['signature'] = instance.signature;
  if (instance.avatar != null) json['avatar'] = instance.avatar;
  if (instance.birthPlaceNote != null)
    json['birthPlaceNote'] = instance.birthPlaceNote;

  return json;
}
