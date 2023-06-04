import 'package:bank_core/models/banks.dart';
import 'package:bank_core/models/currencies.dart';
import 'package:bank_core/models/daycalcs.dart';
import 'package:bank_core/models/district.dart';
import 'package:bank_core/models/genders.dart';
import 'package:bank_core/models/industries.dart';
import 'package:bank_core/models/khoroos.dart';
import 'package:bank_core/models/loantimes.dart';
import 'package:bank_core/models/orgtypes.dart';
import 'package:bank_core/models/province.dart';
import 'package:bank_core/models/whotype.dart';

part '../parts/general.dart';

class General {
  List<Province>? province;
  List<District>? district;
  List<Khoroos>? khoroos;
  List<Genders>? genders;
  List<Industries>? industries;
  List<Orgtypes>? orgtypes;
  List<Banks>? banks;
  List<Loantimes>? loantimes;
  List<Daycalcs>? daycalcs;
  List<Currencies>? currencies;
  List<Whotype>? whotypes;

  General({
    this.province,
    this.banks,
    this.district,
    this.khoroos,
    this.genders,
    this.industries,
    this.orgtypes,
    this.loantimes,
    this.daycalcs,
    this.currencies,
    this.whotypes,
  });

  static $fromJson(Map<String, dynamic> json) => _$GeneralFromJson(json);

  factory General.fromJson(Map<String, dynamic> json) =>
      _$GeneralFromJson(json);
  Map<String, dynamic> toJson() => $GeneralToJson(this);
}
