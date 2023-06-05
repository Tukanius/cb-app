import 'package:bank_core/models/provinces.dart';
import 'package:bank_core/models/districts.dart';
import 'package:bank_core/models/khoroos.dart';
import 'package:bank_core/models/genders.dart';
import 'package:bank_core/models/org-types.dart';
import 'package:bank_core/models/banks.dart';
import 'package:bank_core/models/loan-times.dart';
import 'package:bank_core/models/day-calcs.dart';
import 'package:bank_core/models/currencies.dart';
import 'package:bank_core/models/products.dart';
import 'package:bank_core/models/who-types.dart';
import 'package:bank_core/models/address-types.dart';
import 'package:bank_core/models/marriage-statuses.dart';
import 'package:bank_core/models/education-types.dart';
import 'package:bank_core/models/employee-units.dart';
import 'package:bank_core/models/nationality-types.dart';
import 'package:bank_core/models/work-status.dart';
import 'package:bank_core/models/department-units.dart';
import 'package:bank_core/models/loan-types.dart';
import 'package:bank_core/models/loan-products.dart';
import 'package:bank_core/models/loan-categories.dart';
import 'package:bank_core/models/borrow-types.dart';
import 'package:bank_core/models/loan-rate-types.dart';
import 'package:bank_core/models/rate-types.dart';
import 'package:bank_core/models/cap-freqs.dart';
import 'package:bank_core/models/accr-freqs.dart';
import 'package:bank_core/models/calc-types.dart';
import 'package:bank_core/models/holiday-calcs.dart';
import 'package:bank_core/models/loan-pay-types.dart';
import 'package:bank_core/models/loan-pay-freqs.dart';
import 'package:bank_core/models/loan-statuses.dart';
import 'package:bank_core/models/industries.dart';
part '../parts/general.dart';

class General {
  List<Provinces>? provinces;
  List<Districts>? districts;
  List<Khoroos>? khoroos;
  List<Genders>? genders;
  List<Industries>? industries;
  List<OrgTypes>? orgTypes;
  List<Banks>? banks;
  List<LoanTimes>? loanTimes;
  List<DayCalcs>? dayCalcs;
  List<Currencies>? currencies;
  List<WhoTypes>? whoTypes;
  List<AddressTypes>? addressTypes;
  List<MarriageStatuses>? marriageStatuses;
  List<EducationTypes>? educationTypes;
  List<EmployeeUnits>? employeeUnits;
  List<NationalityTypes>? nationalityTypes;
  List<WorkStatus>? workStatus;
  List<DepartmentUnits>? departmentUnits;
  List<LoanTypes>? loanTypes;
  List<LoanProducts>? loanProducts;
  List<LoanCategories>? loanCategories;
  List<BorrowTypes>? borrowTypes;
  List<LoanRateTypes>? loanRateTypes;
  List<Products>? products;
  List<RateTypes>? rateTypes;
  List<CapFreqs>? capFreqs;
  List<AccrFreqs>? accrFreqs;
  List<CalcTypes>? calcTypes;
  List<LoanPayTypes>? loanPayTypes;
  List<HolidayCalcs>? holidayCalcs;
  List<LoanPayFreqs>? loanPayFreqs;
  List<LoanStatuses>? loanStatuses;

  General({
    this.industries,
    this.currencies,
    this.banks,
    this.provinces,
    this.districts,
    this.khoroos,
    this.genders,
    this.orgTypes,
    this.loanTimes,
    this.dayCalcs,
    this.whoTypes,
    this.addressTypes,
    this.marriageStatuses,
    this.educationTypes,
    this.employeeUnits,
    this.nationalityTypes,
    this.workStatus,
    this.departmentUnits,
    this.loanTypes,
    this.loanProducts,
    this.loanCategories,
    this.borrowTypes,
    this.loanRateTypes,
    this.products,
    this.rateTypes,
    this.capFreqs,
    this.accrFreqs,
    this.calcTypes,
    this.loanPayTypes,
    this.holidayCalcs,
    this.loanPayFreqs,
    this.loanStatuses,
  });

  static $fromJson(Map<String, dynamic> json) => _$GeneralFromJson(json);

  factory General.fromJson(Map<String, dynamic> json) =>
      _$GeneralFromJson(json);
  Map<String, dynamic> toJson() => _$GeneralToJson(this);
}
