part '../parts/contact.dart';

class Contact {
  String? id;
  String? phoneNumber;
  String? email;
  String? address;

  Contact({
    this.id,
    this.phoneNumber,
    this.address,
    this.email,
  });

  static $fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
