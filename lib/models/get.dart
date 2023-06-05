part '../parts/get.dart';

class Get {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? accountNumber;
  String? balance;
  String? scoreAmount;
  String? loanAmount;
  bool? isActive;
  String? customerId;

  String? sessionId;
  String? email;
  String? username;
  bool? isEmailVerified;
  String? emailVerifiedDate;
  String? phone;
  bool? isPhoneVerified;
  String? phoneVerifiedDate;
  String? lastName;
  String? firstName;
  String? password;
  String? sessionScope;
  int? expiryHours;
  bool? userSuspended;
  bool? passwordExpired;
  bool? passwordNeedChange;
  bool? userTerminated;
  String? expiryDate;
  String? userStatus;
  String? userStatusDate;
  String? staffId;
  Get? customer;
  Get? regUser;
  Get? result;
  String? familyName;
  String? birthDate;
  String? registerNo;
  String? signature;
  String? educationTypeId;
  String? marriageStatusId;
  String? familyCount;
  String? incomeAmountMonth;
  String? avatar;
  String? nationalityTypeId;
  String? genderId;

  Get({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
    this.accountNumber,
    this.balance,
    this.scoreAmount,
    this.loanAmount,
    this.isActive,
    this.customerId,
  });

  static $fromJson(Map<String, dynamic> json) => _$GetFromJson(json);

  factory Get.fromJson(Map<String, dynamic> json) => _$GetFromJson(json);
  Map<String, dynamic> toJson() => _$GetToJson(this);
}
