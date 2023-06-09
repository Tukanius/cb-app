part '../parts/answer.dart';

class Answer {
  String? id;
  String? answer;
  String? string;
  int? count;
  List<Answer>? rows;

  Answer({
    this.id,
    this.answer,
    this.string,
    this.count,
    this.rows,
  });

  static $fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
