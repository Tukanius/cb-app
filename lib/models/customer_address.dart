part '../parts/customer_address.dart';

class CustomerAddress {
  String? customerId;
  String? addressType;
  String? provinceId;
  String? districtId;
  String? khorooId;
  String? address;

  CustomerAddress({
    this.customerId,
    this.addressType,
    this.provinceId,
    this.districtId,
    this.khorooId,
    this.address,
  });

  static $fromJson(Map<String, dynamic> json) =>
      _$CustomerAddressFromJson(json);

  factory CustomerAddress.fromJson(Map<String, dynamic> json) =>
      _$CustomerAddressFromJson(json);
  Map<String, dynamic> toJson() => $CustomerAddressToJson(this);
}
