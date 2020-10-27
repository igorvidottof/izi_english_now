import 'package:izi_english_now/models/answer.dart';

class Question {
  final String text;
  final String audioUrl;
  final List<Answer> answers;

  Question(
    this.text,
    this.audioUrl,
    this.answers,
  );
}
