import 'package:izi_english_now/data/questions.dart';
import 'package:izi_english_now/models/deck.dart';
import 'package:izi_english_now/models/deck_category.dart';

class DecksData {
  static final List<Deck> introduction = [
    Deck(
      id: 0,
      title: 'Saudações',
      description: 'Aprenda como cumprimentar as pessoas',
      totalLessons: Questions.greetings.length,
      lessonsCompleted: 5,
      questions: Questions.greetings,
    ),
    Deck(
      id: 1,
      title: 'Animais',
      description: 'Descubra o nome dos animais em inglês',
      totalLessons: Questions.animals.length,
      lessonsCompleted: 1,
      questions: Questions.animals,
    ),
    Deck(
      id: 2,
      title: 'Cozinha',
      description: 'Veja como são chamados os utensílios utilizados na cozinha',
      totalLessons: Questions.kitchen.length,
      lessonsCompleted: 0,
      questions: Questions.kitchen,
    ),
  ];

  static final List<DeckCategory> deckCategories = [
    DeckCategory(0, 'Introduction (Introdução)', introduction),
    DeckCategory(1, 'Basics (Básico)', introduction),
  ];
}
