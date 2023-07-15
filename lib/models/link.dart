part '../parts/link.dart';

class Link {
  String? name;
  String? description;
  String? logo;
  String? link;
  String? code;

  Link({this.name, this.description, this.link, this.logo, this.code});

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
