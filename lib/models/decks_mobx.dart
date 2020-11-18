import 'package:izi_english_now/data/decks_data.dart';
import 'package:izi_english_now/models/deck.dart';
import 'package:izi_english_now/models/deck_category.dart';
import 'package:mobx/mobx.dart';
part 'decks_mobx.g.dart';

class DecksMobx = _DecksMobxBase with _$DecksMobx;

abstract class _DecksMobxBase with Store {
  final List<DeckCategory> deckCategories = DecksData.deckCategories;
  // final List<Deck> items = decks;

  double getCourseCompletion() {
    var totalLessons = 0;
    var lessonsCompleted = 0;
    deckCategories.forEach((deckCategory) {
      deckCategory.decks.forEach((item) {
        totalLessons += item.totalLessons;
        lessonsCompleted += item.lessonsCompleted;
      });
    });

    return lessonsCompleted / totalLessons;
  }

  Deck getDeckById(int deckId) {
    Deck deck;
    deckCategories.forEach((deckCategory) {
      deck = deckCategory.decks.firstWhere((deck) {
        return deck.id == deckId;
      });
    });
    return deck;
  }

  @action
  void completeLesson(int deckId) {
    final deck = getDeckById(deckId);
    if (deck.lessonsCompleted < deck.totalLessons) {
      deck.lessonsCompleted++;
    }
  }
}
