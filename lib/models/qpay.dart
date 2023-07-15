import 'package:bank_core/models/qpay-urls.dart';

part '../parts/qpay.dart';

class Qpay {
  String? invoiceId;
  String? qrText;
  String? qrImage;
  String? qPayShortUrl;
  String? loanId;
  String? loanPaybackGraphId;
  double? amount;
  List<Urls>? urls;

  Qpay({
    this.invoiceId,
    this.qrText,
    this.qrImage,
    this.qPayShortUrl,
    this.loanId,
    this.loanPaybackGraphId,
    this.amount,
    this.urls,
  });

  static $fromJson(Map<String, dynamic> json) => _$QpayFromJson(json);

  factory Qpay.fromJson(Map<String, dynamic> json) => _$QpayFromJson(json);
  Map<String, dynamic> toJson() => _$QpayToJson(this);
}
