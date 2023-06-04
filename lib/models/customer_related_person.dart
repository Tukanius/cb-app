part '../parts/customer_related_person.dart';

class CustomerRelated {
  String? customerId;
  String? whoTypeId;
  String? firstName;
  String? lastName;
  String? phone;

  CustomerRelated({
    this.customerId,
    this.whoTypeId,
    this.firstName,
    this.lastName,
    this.phone,
  });

  static $fromJson(Map<String, dynamic> json) =>
      _$CustomerRelatedFromJson(json);

  factory CustomerRelated.fromJson(Map<String, dynamic> json) =>
      _$CustomerRelatedFromJson(json);
  Map<String, dynamic> toJson() => $CustomerRelatedToJson(this);
}
