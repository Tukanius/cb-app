import 'package:intl/intl.dart';
import 'package:simple_moment/simple_moment.dart';
part '../parts/customer.dart';

class Customer {
  int? count;
  List<Customer>? rows;
  String? id;
  String? customerId;
  String? whoTypeId;
  String? firstName;
  String? lastName;
  String? phone;
  bool? isActive;
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

  String getPostDate() {
    return Moment.parse(DateFormat("yyyy-MM-dd")
            .parseUTC(createdAt!)
            .toLocal()
            .toIso8601String())
        .format("yyyy-MM-dd");
  }

  Customer({
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
    this.isActive,
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
