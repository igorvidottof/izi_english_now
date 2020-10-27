import 'package:flutter/foundation.dart';
import 'package:izi_english_now/models/question.dart';

import 'package:mobx/mobx.dart';
part 'lesson_category_mobx.g.dart';

class LessonCategoryMobx = _LessonCategoryMobxBase with _$LessonCategoryMobx;

abstract class _LessonCategoryMobxBase with Store {
  final String title;
  final String description;
  final int totalLessons;
  @observable
  int lessonsCompleted;
  final List<Question> questions;

  _LessonCategoryMobxBase({
    @required this.title,
    @required this.description,
    @required this.totalLessons,
    this.lessonsCompleted = 0,
    @required this.questions,
  });
}
