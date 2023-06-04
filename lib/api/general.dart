import 'dart:io';

import 'package:bank_core/models/general.dart';
import 'package:bank_core/utils/http_request.dart';

class GeneralApi extends HttpRequest {
  Future<General> init(bool handler) async {
    var res = await get("/general/init", handler: true);
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> Province(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> District(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> Khoroos(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> Genders(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> Industries(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> Orgtypes(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> Banks(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> Loantimes(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> Daycalcs(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> Currencies(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> WhoType(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> AddressType(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }

  Future<General> MarriageStatuses(bool handler) async {
    var res = await post('/general/init');
    return General.fromJson(res as Map<String, dynamic>);
  }
}
