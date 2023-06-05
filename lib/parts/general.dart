part of '../models/general.dart';

General _$GeneralFromJson(Map<String, dynamic> json) {
  return General(
    provinces: json['provinces'] != null
        ? (json['provinces'] as List).map((e) => Provinces.fromJson(e)).toList()
        : null,
    districts: json['districts'] != null
        ? (json['districts'] as List).map((e) => Districts.fromJson(e)).toList()
        : null,
    khoroos: json['khoroos'] != null
        ? (json['khoroos'] as List).map((e) => Khoroos.fromJson(e)).toList()
        : null,
    genders: json['genders'] != null
        ? (json['genders'] as List).map((e) => Genders.fromJson(e)).toList()
        : null,
    orgTypes: json['orgTypes'] != null
        ? (json['orgTypes'] as List).map((e) => OrgTypes.fromJson(e)).toList()
        : null,
    loanTimes: json['loanTimes'] != null
        ? (json['loanTimes'] as List).map((e) => LoanTimes.fromJson(e)).toList()
        : null,
    dayCalcs: json['dayCalcs'] != null
        ? (json['dayCalcs'] as List).map((e) => DayCalcs.fromJson(e)).toList()
        : null,
    whoTypes: json['whoTypes'] != null
        ? (json['whoTypes'] as List).map((e) => WhoTypes.fromJson(e)).toList()
        : null,
    addressTypes: json['addressTypes'] != null
        ? (json['addressTypes'] as List)
            .map((e) => AddressTypes.fromJson(e))
            .toList()
        : null,
    marriageStatuses: json['marriageStatuses'] != null
        ? (json['marriageStatuses'] as List)
            .map((e) => MarriageStatuses.fromJson(e))
            .toList()
        : null,
    educationTypes: json['educationTypes'] != null
        ? (json['educationTypes'] as List)
            .map((e) => EducationTypes.fromJson(e))
            .toList()
        : null,
    employeeUnits: json['employeeUnits'] != null
        ? (json['employeeUnits'] as List)
            .map((e) => EmployeeUnits.fromJson(e))
            .toList()
        : null,
    nationalityTypes: json['nationalityTypes'] != null
        ? (json['nationalityTypes'] as List)
            .map((e) => NationalityTypes.fromJson(e))
            .toList()
        : null,
    workStatus: json['workStatus'] != null
        ? (json['workStatus'] as List)
            .map((e) => WorkStatus.fromJson(e))
            .toList()
        : null,
    departmentUnits: json['departmentUnits'] != null
        ? (json['departmentUnits'] as List)
            .map((e) => DepartmentUnits.fromJson(e))
            .toList()
        : null,
    loanTypes: json['loanTypes'] != null
        ? (json['loanTypes'] as List).map((e) => LoanTypes.fromJson(e)).toList()
        : null,
    loanProducts: json['loanProducts'] != null
        ? (json['loanProducts'] as List)
            .map((e) => LoanProducts.fromJson(e))
            .toList()
        : null,
    loanCategories: json['loanCategories'] != null
        ? (json['loanCategories'] as List)
            .map((e) => LoanCategories.fromJson(e))
            .toList()
        : null,
    borrowTypes: json['borrowTypes'] != null
        ? (json['borrowTypes'] as List)
            .map((e) => BorrowTypes.fromJson(e))
            .toList()
        : null,
    loanRateTypes: json['loanRateTypes'] != null
        ? (json['loanRateTypes'] as List)
            .map((e) => LoanRateTypes.fromJson(e))
            .toList()
        : null,
    products: json['products'] != null
        ? (json['products'] as List).map((e) => Products.fromJson(e)).toList()
        : null,
    rateTypes: json['rateTypes'] != null
        ? (json['rateTypes'] as List).map((e) => RateTypes.fromJson(e)).toList()
        : null,
    capFreqs: json['capFreqs'] != null
        ? (json['capFreqs'] as List).map((e) => CapFreqs.fromJson(e)).toList()
        : null,
    accrFreqs: json['accrFreqs'] != null
        ? (json['accrFreqs'] as List).map((e) => AccrFreqs.fromJson(e)).toList()
        : null,
    calcTypes: json['calcTypes'] != null
        ? (json['calcTypes'] as List).map((e) => CalcTypes.fromJson(e)).toList()
        : null,
    loanPayTypes: json['loanPayTypes'] != null
        ? (json['loanPayTypes'] as List)
            .map((e) => LoanPayTypes.fromJson(e))
            .toList()
        : null,
    holidayCalcs: json['holidayCalcs'] != null
        ? (json['holidayCalcs'] as List)
            .map((e) => HolidayCalcs.fromJson(e))
            .toList()
        : null,
    loanPayFreqs: json['loanPayFreqs'] != null
        ? (json['loanPayFreqs'] as List)
            .map((e) => LoanPayFreqs.fromJson(e))
            .toList()
        : null,
    loanStatuses: json['loanStatuses'] != null
        ? (json['loanStatuses'] as List)
            .map((e) => LoanStatuses.fromJson(e))
            .toList()
        : null,
  );
}

Map<String, dynamic> _$GeneralToJson(General instance) {
  Map<String, dynamic> json = {};

  if (instance.provinces != null) json['provinces'] = instance.provinces;
  if (instance.districts != null) json['districts'] = instance.districts;
  if (instance.khoroos != null) json['khoroos'] = instance.khoroos;
  if (instance.genders != null) json['genders'] = instance.genders;
  if (instance.orgTypes != null) json['orgTypes'] = instance.orgTypes;
  if (instance.loanTimes != null) json['loanTimes'] = instance.loanTimes;
  if (instance.dayCalcs != null) json['dayCalcs'] = instance.dayCalcs;
  if (instance.whoTypes != null) json['whoTypes'] = instance.whoTypes;
  if (instance.addressTypes != null)
    json['addressTypes'] = instance.addressTypes;
  if (instance.marriageStatuses != null)
    json['marriageStatuses'] = instance.marriageStatuses;
  if (instance.educationTypes != null)
    json['educationTypes'] = instance.educationTypes;
  if (instance.employeeUnits != null)
    json['employeeUnits'] = instance.employeeUnits;
  if (instance.nationalityTypes != null)
    json['nationalityTypes'] = instance.nationalityTypes;
  if (instance.workStatus != null) json['workStatus'] = instance.workStatus;
  if (instance.departmentUnits != null)
    json['departmentUnits'] = instance.departmentUnits;
  if (instance.loanTypes != null) json['loanTypes'] = instance.loanTypes;
  if (instance.loanProducts != null)
    json['loanProducts'] = instance.loanProducts;
  if (instance.loanCategories != null)
    json['loanCategories'] = instance.loanCategories;
  if (instance.borrowTypes != null) json['borrowTypes'] = instance.borrowTypes;
  if (instance.loanRateTypes != null)
    json['loanRateTypes'] = instance.loanRateTypes;
  if (instance.products != null) json['products'] = instance.products;
  if (instance.rateTypes != null) json['rateTypes'] = instance.rateTypes;
  if (instance.capFreqs != null) json['capFreqs'] = instance.capFreqs;
  if (instance.accrFreqs != null) json['accrFreqs'] = instance.accrFreqs;
  if (instance.calcTypes != null) json['calcTypes'] = instance.calcTypes;
  if (instance.loanPayTypes != null)
    json['loanPayTypes'] = instance.loanPayTypes;
  if (instance.holidayCalcs != null)
    json['holidayCalcs'] = instance.holidayCalcs;
  if (instance.loanPayFreqs != null)
    json['loanPayFreqs'] = instance.loanPayFreqs;
  if (instance.loanStatuses != null)
    json['loanStatuses'] = instance.loanStatuses;

  return json;
}
