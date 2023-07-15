part of '../models/link.dart';

Link _$LinkFromJson(Map<String, dynamic> json) {
  return Link(
      name: json["name"] as String?,
      description: json["description"] as String?,
      logo: json["logo"] as String?,
      link: json["link"] as String?,
      code: json["code"] as String?);
}

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'description': instance.description,
      'link': instance.link,
      'code': instance.code,
    };
