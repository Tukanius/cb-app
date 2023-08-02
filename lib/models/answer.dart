part '../parts/answer.dart';

class Answer {
  String? id;
  String? answer;
  String? question;
  String? string;
  int? count;
  String? type;
  List<Answer>? rows;

  Answer({
    this.id,
    this.answer,
    this.string,
    this.count,
    this.rows,
    this.question,
    this.type,
  });

  static $fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
