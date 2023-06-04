part of '../models/user.dart';

User $UserFromJson(Map<String, dynamic> json) {
  String? familyName;
  String? password;
  String? birthDate;
  String? registerNo;
  String? phone;
  String? email;
  String? signature;
  String? educationType;
  String? marriageStatus;
  String? familyCount;
  String? incomeAmountMonth;
  String? avatar;
  String? nationalityType;
  String? genderId;
  String? birthPlace;
  String? birthPlaceNote;
  String? userId;
  String? updatedAt;
  String? createdAt;
  bool? deletedAt;
  bool? isActive;
  String? customerId;
  String? isOriginal;
  String? bankId;
  String? accountNumber;
  String? addressType;
  String? provinceId;
  String? districtId;
  String? khorooId;
  String? address;
  String? name;
  String? url;
  String? whoType;
  String? firstName;
  String? lastName;
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  String? sessionState;
  String? id;

  if (json['password'] != null) password = json['password'];
  if (json['familyName'] != null) familyName = json['familyName'];
  if (json['birthDate'] != null) birthDate = json['birthDate'];
  if (json['registerNo'] != null) registerNo = json['registerNo'];
  if (json['phone'] != null) phone = json['phone'];
  if (json['email'] != null) email = json['email'];
  if (json['signature'] != null) signature = json['signature'];
  if (json['educationType'] != null) educationType = json['educationType'];
  if (json['marriageStatus'] != null) marriageStatus = json['marriageStatus'];
  if (json['familyCount'] != null) familyCount = json['familyCount'];
  if (json['incomeAmountMonth'] != null)
    incomeAmountMonth = json['incomeAmountMonth'];
  if (json['avatar'] != null) avatar = json['avatar'];
  if (json['nationalityType'] != null)
    nationalityType = json['nationalityType'];
  if (json['genderId'] != null) genderId = json['genderId'];
  if (json['birthPlace'] != null) birthPlace = json['birthPlace'];
  if (json['birthPlaceNote'] != null) birthPlaceNote = json['birthPlaceNote'];
  if (json['userId'] != null) userId = json['userId'];
  if (json['accountNumber'] != null) accountNumber = json['accountNumber'];
  if (json['addressType'] != null) addressType = json['addressType'];
  if (json['provinceId'] != null) provinceId = json['provinceId'];
  if (json['districtId'] != null) districtId = json['districtId'];
  if (json['khorooId'] != null) khorooId = json['khorooId'];
  if (json['address'] != null) address = json['address'];
  if (json['name'] != null) name = json['name'];
  if (json['url'] != null) url = json['url'];
  if (json['whoType'] != null) whoType = json['whoType'];
  if (json['firstName'] != null) firstName = json['firstName'];
  if (json['lastName'] != null) lastName = json['lastName'];
  if (json['accessToken'] != null) accessToken = json['accessToken'];
  if (json['tokenType'] != null) tokenType = json['tokenType'];
  if (json['refreshToken'] != null) refreshToken = json['refreshToken'];
  if (json['sessionState'] != null) sessionState = json['sessionState'];
  if (json['id'] != null) id = json['id'];

  return User(
    password: password,
    accountNumber: accountNumber,
    address: address,
    addressType: addressType,
    avatar: avatar,
    bankId: bankId,
    birthDate: birthDate,
    birthPlace: birthPlace,
    birthPlaceNote: birthPlaceNote,
    createdAt: createdAt,
    customerId: customerId,
    deletedAt: deletedAt,
    districtId: districtId,
    educationType: educationType,
    email: email,
    familyCount: familyCount,
    familyName: familyName,
    firstName: firstName,
    genderId: genderId,
    incomeAmountMonth: incomeAmountMonth,
    isActive: isActive,
    isOriginal: isOriginal,
    khorooId: khorooId,
    lastName: lastName,
    marriageStatus: marriageStatus,
    name: name,
    nationalityType: nationalityType,
    phone: phone,
    provinceId: provinceId,
    registerNo: registerNo,
    signature: signature,
    updatedAt: updatedAt,
    url: url,
    userId: userId,
    whoType: whoType,
    accessToken: accessToken,
    tokenType: tokenType,
    refreshToken: refreshToken,
    sessionState: sessionState,
    id: id,
  );
}

Map<String, dynamic> $UserToJson(User instance) {
  Map<String, dynamic> json = {};

  if (instance.password != null) json['password'] = instance.password;
  if (instance.lastName != null) json['lastName'] = instance.lastName;
  if (instance.familyName != null) json['familyName'] = instance.familyName;
  if (instance.birthDate != null) json['birthDate'] = instance.birthDate;
  if (instance.registerNo != null) json['registerNo'] = instance.registerNo;
  if (instance.phone != null) json['phone'] = instance.phone;
  if (instance.email != null) json['email'] = instance.email;
  if (instance.signature != null) json['signature'] = instance.signature;
  if (instance.educationType != null)
    json['educationType'] = instance.educationType;
  if (instance.marriageStatus != null)
    json['marriageStatus'] = instance.marriageStatus;
  if (instance.familyCount != null) json['familyCount'] = instance.familyCount;
  if (instance.incomeAmountMonth != null) {
    json['incomeAmountMonth'] = instance.incomeAmountMonth;
  }
  if (instance.avatar != null) json['avatar'] = instance.avatar;
  if (instance.nationalityType != null)
    json['nationalityType'] = instance.nationalityType;
  if (instance.genderId != null) json['genderId'] = instance.genderId;
  if (instance.birthPlace != null) json['birthPlace'] = instance.birthPlace;
  if (instance.birthPlaceNote != null)
    json['birthPlaceNote'] = instance.birthPlaceNote;
  if (instance.userId != null) {
    json['userId'] = instance.userId;
  }
  if (instance.updatedAt != null) json['updatedAt'] = instance.updatedAt;
  if (instance.createdAt != null) json['createdAt'] = instance.createdAt;
  if (instance.deletedAt != null) json['deletedAt'] = instance.deletedAt;
  if (instance.isActive != null) json['isActive'] = instance.isActive;
  if (instance.customerId != null) json['customerId'] = instance.customerId;
  if (instance.isOriginal != null) json['isOriginal'] = instance.isOriginal;
  if (instance.bankId != null) json['bankId'] = instance.bankId;
  if (instance.accountNumber != null)
    json['accountNumber'] = instance.accountNumber;
  if (instance.addressType != null) json['addressType'] = instance.addressType;
  if (instance.provinceId != null) json['provinceId'] = instance.provinceId;
  if (instance.districtId != null) json['districtId'] = instance.districtId;
  if (instance.khorooId != null) json['khorooId'] = instance.khorooId;
  if (instance.address != null) json['address'] = instance.address;
  if (instance.name != null) json['name'] = instance.name;
  if (instance.url != null) json['url'] = instance.url;
  if (instance.whoType != null) json['whoType'] = instance.whoType;
  if (instance.firstName != null) json['firstName'] = instance.firstName;

  if (instance.accessToken != null) json['accessToken'] = instance.accessToken;
  if (instance.tokenType != null) json['tokenType'] = instance.tokenType;
  if (instance.refreshToken != null)
    json['refreshToken'] = instance.refreshToken;
  if (instance.sessionState != null)
    json['sessionState'] = instance.sessionState;
  if (instance.id != null) json['id'] = instance.id;

  return json;
}
