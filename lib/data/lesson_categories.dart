import 'package:izi_english_now/data/questions.dart';
import 'package:izi_english_now/models/lesson_category_mobx.dart';

final List<LessonCategoryMobx> lessonCategories = [
  LessonCategoryMobx(
    title: 'Saudações',
    description: 'Aprenda como cumprimentar as pessoas',
    totalLessons: Questions.greetings.length,
    questions: Questions.greetings,
  ),
  LessonCategoryMobx(
    title: 'Animais',
    description: 'Descubra o nome dos animais em inglês',
    totalLessons: Questions.animals.length,
    questions: Questions.animals,
  ),
  LessonCategoryMobx(
    title: 'Cozinha',
    description: 'Veja como são chamados os utensílios utilizados na cozinha',
    totalLessons: Questions.kitchen.length,
    questions: Questions.kitchen,
  ),
];
