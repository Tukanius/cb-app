part '../parts/user.dart';

class User {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? sessionId;
  bool? isActive;
  String? email;
  String? username;
  bool? isEmailVerified;
  String? emailVerifiedDate;
  String? phone;
  String? isPhoneVerified;
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
  String? customerId;
  User? customer;
  User? regUser;
  String? oldPassword;

  String? userId;
  String? tokenType;
  String? accessToken;
  String? refreshToken;
  String? sessionState;

  String? registerNo;
  String? genderId;
  String? birthDate;

  String? whoTypeId;

  User({
    this.whoTypeId,
    this.registerNo,
    this.genderId,
    this.birthDate,
    this.userId,
    this.tokenType,
    this.accessToken,
    this.refreshToken,
    this.sessionState,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.sessionId,
    this.isActive,
    this.email,
    this.username,
    this.oldPassword,
    this.isEmailVerified,
    this.emailVerifiedDate,
    this.phone,
    this.isPhoneVerified,
    this.phoneVerifiedDate,
    this.lastName,
    this.firstName,
    this.password,
    this.sessionScope,
    this.expiryHours,
    this.userSuspended,
    this.passwordExpired,
    this.passwordNeedChange,
    this.userTerminated,
    this.expiryDate,
    this.userStatus,
    this.userStatusDate,
    this.staffId,
    this.customerId,
    this.customer,
    this.regUser,
  });

  static $fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
