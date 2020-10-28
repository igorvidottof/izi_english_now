import 'package:flutter/foundation.dart';
import 'package:izi_english_now/models/question.dart';

import 'package:mobx/mobx.dart';
part 'deck.g.dart';

class Deck = _DeckBase with _$Deck;

abstract class _DeckBase with Store {
  final int id;
  final String title;
  final String description;
  final int totalLessons;
  @observable
  int lessonsCompleted;
  final List<Question> questions;

  _DeckBase({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.totalLessons,
    this.lessonsCompleted = 0,
    @required this.questions,
  });
}
