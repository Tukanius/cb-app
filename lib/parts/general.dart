part of '../models/general.dart';

General _$GeneralFromJson(Map<String, dynamic> json) {
  return General(
    province: json['province'] != null
        ? (json['province'] as List).map((e) => Province.fromJson(e)).toList()
        : null,
    banks: json['banks'] != null
        ? (json['banks'] as List).map((e) => Banks.fromJson(e)).toList()
        : null,
    district: json['district'] != null
        ? (json['district'] as List).map((e) => District.fromJson(e)).toList()
        : null,
    whotypes: json['whotypes'] != null
        ? (json['whotypes'] as List).map((e) => Whotype.fromJson(e)).toList()
        : null,
  );
}

Map<String, dynamic> $GeneralToJson(General instance) {
  Map<String, dynamic> json = {};
  if (instance.province != null) json['province'] = instance.province;
  if (instance.banks != null) json['banks'] = instance.banks;
  if (instance.whotypes != null) json['whotypes'] = instance.whotypes;

  return json;
}
