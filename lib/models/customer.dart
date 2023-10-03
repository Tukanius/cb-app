import "package:moment_dart/moment_dart.dart";
part '../parts/customer.dart';

class Customer {
  int? count;
  int? day;
  List<Customer>? rows;
  String? todayAmount;
  String? id;
  String? customerId;
  String? whoTypeId;
  String? firstName;
  String? lastName;
  String? phone;
  String? loan_date;
  // bool? isActive;
  String? createdAt;
  String? createdUserId;
  String? updatedAt;
  String? updatedUserId;
  String? deletedAt;
  Customer? whoType;
  String? name;
  String? bankId;
  String? accountNumber;
  Customer? bank;
  String? addressTypeId;
  String? provinceId;
  String? districtId;
  Customer? loanType;
  Customer? loanTime;
  String? khorooId;
  String? address;
  Customer? province;
  Customer? district;
  Customer? khoroo;
  Customer? addressType;
  String? totalPayAmount;
  String? payDate;
  String? loanStatusId;
  Customer? loan;
  String? loanId;
  String? loanResidual;
  String? rateCalcDay;
  String? rateAmount;
  String? mainLoanPayAmount;
  double? amount;
  String? paidDate;
  String? payerUserId;
  String? educationTypeId;
  String? marriageStatusId;
  int? familyCount;
  double? incomeAmountMonth;
  String? nationalityTypeId;
  String? genderId;
  String? birthPlace;
  String? workStatusId;
  String? loanRate;
  String? familyName;
  String? birthDate;
  String? registerNo;
  String? email;
  String? signature;
  String? avatar;
  String? birthPlaceNote;
  Customer? result;
  Customer? educationType;
  Customer? marriageStatus;
  Customer? nationalityType;
  Customer? gender;
  Customer? workStatus;
  String? total_pay_amount;
  String? type;
  String? transactionStatus;
  String? paymentId;
  String? paymentMethod;
  String? creditAccountBank;
  String? creditAccountId;
  String? creditAccountNumber;
  String? creditAccountCurrency;
  String? creditAccountName;
  String? debitAccountId;
  String? debitAccountBank;
  String? debitAccountNumber;
  String? debitAccountName;
  String? debitAccountCurrency;
  String? description;
  String? addInfo;
  Customer? loanProduct;
  String? balance;
  String? code;
  String? loanAmount;
  String? logoUrl;
  List<Customer>? loanProductRate;
  String? maxRate;
  bool? success;
  String? loanDate;

  String getPostDate() {
    final now = Moment.now();
    var res = now.format(createdAt.toString());
    return res;
  }

  Customer({
    this.todayAmount,
    this.loanTime,
    this.day,
    this.loanDate,
    this.success,
    this.logoUrl,
    this.code,
    this.maxRate,
    this.loanProductRate,
    this.loanAmount,
    this.balance,
    this.loanProduct,
    this.type,
    this.transactionStatus,
    this.paymentId,
    this.paymentMethod,
    this.creditAccountBank,
    this.creditAccountId,
    this.creditAccountNumber,
    this.creditAccountCurrency,
    this.creditAccountName,
    this.debitAccountId,
    this.debitAccountBank,
    this.debitAccountNumber,
    this.debitAccountName,
    this.debitAccountCurrency,
    this.description,
    this.addInfo,
    this.total_pay_amount,
    this.educationType,
    this.marriageStatus,
    this.nationalityType,
    this.gender,
    this.loanType,
    this.workStatus,
    this.result,
    this.familyName,
    this.birthDate,
    this.registerNo,
    this.email,
    this.signature,
    this.avatar,
    this.birthPlaceNote,
    this.loanRate,
    this.educationTypeId,
    this.marriageStatusId,
    this.familyCount,
    this.incomeAmountMonth,
    this.nationalityTypeId,
    this.genderId,
    this.birthPlace,
    this.workStatusId,
    this.payerUserId,
    this.paidDate,
    this.amount,
    this.rateAmount,
    this.mainLoanPayAmount,
    this.loanResidual,
    this.rateCalcDay,
    this.loanId,
    this.totalPayAmount,
    this.payDate,
    this.loan_date,
    this.loanStatusId,
    this.loan,
    this.province,
    this.district,
    this.khoroo,
    this.addressType,
    this.addressTypeId,
    this.provinceId,
    this.districtId,
    this.khorooId,
    this.address,
    this.bankId,
    this.accountNumber,
    this.bank,
    this.count,
    this.rows,
    this.id,
    this.customerId,
    this.whoTypeId,
    this.firstName,
    this.lastName,
    this.phone,
    // this.isActive,
    this.createdAt,
    this.createdUserId,
    this.updatedAt,
    this.updatedUserId,
    this.deletedAt,
    this.whoType,
    this.name,
  });

  static $fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
