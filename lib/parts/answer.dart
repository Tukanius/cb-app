part of '../models/answer.dart';

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    id: json['id'] != null ? json['id'] as String : null,
    answer: json['answer'] != null ? json['answer'] as String : null,
    string: json['string'] != null ? json['string'] as String : null,
    count: json['count'] != null ? int.parse(json['count'].toString()) : null,
    rows: json['rows'] != null
        ? (json['rows'] as List).map((e) => Answer.fromJson(e)).toList()
        : null,
  );
}

Map<String, dynamic> _$AnswerToJson(Answer instance) {
  Map<String, dynamic> json = {};
  if (instance.id != null) json['id'] = instance.id;
  if (instance.answer != null) json['answer'] = instance.answer;
  if (instance.string != null) json['string'] = instance.string;
  if (instance.count != null) json['count'] = instance.count;
  if (instance.rows != null) json['rows'] = instance.rows;

  return json;
}
