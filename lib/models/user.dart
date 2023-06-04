import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
part '../parts/user.dart';

class User {
  final GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  String? firstName;
  String? lastName;
  String? familyName;
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

  String? password;
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
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  String? sessionState;
  String? id;

  User({
    this.firstName,
    this.lastName,
    this.familyName,
    this.birthDate,
    this.registerNo,
    this.phone,
    this.email,
    this.signature,
    this.educationType,
    this.marriageStatus,
    this.familyCount,
    this.incomeAmountMonth,
    this.avatar,
    this.nationalityType,
    this.genderId,
    this.birthPlace,
    this.birthPlaceNote,
    this.password,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.deletedAt,
    this.isActive,
    this.customerId,
    this.isOriginal,
    this.bankId,
    this.accountNumber,
    this.addressType,
    this.provinceId,
    this.districtId,
    this.khorooId,
    this.address,
    this.name,
    this.url,
    this.whoType,
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.sessionState,
    this.id,
  });

  static $fromJson(Map<String, dynamic> json) => $UserFromJson(json);

  factory User.fromJson(Map<String, dynamic> json) => $UserFromJson(json);
  Map<String, dynamic> toJson() => $UserToJson(this);
}
