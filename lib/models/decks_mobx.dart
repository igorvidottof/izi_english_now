import 'package:izi_english_now/data/decks_data.dart';
import 'package:izi_english_now/models/deck.dart';
import 'package:mobx/mobx.dart';
part 'decks_mobx.g.dart';

class DecksMobx = _DecksMobxBase with _$DecksMobx;

abstract class _DecksMobxBase with Store {
  final List<Deck> items = decks;

  double getCourseCompletion() {
    var totalLessons = 0;
    var lessonsCompleted = 0;
    items.forEach((item) {
      totalLessons += item.totalLessons;
      lessonsCompleted += item.lessonsCompleted;
    });
    return lessonsCompleted / totalLessons;
    // return 5 / 17;
  }

  Deck getDeckById(int deckId) {
    return items.firstWhere((item) {
      return item.id == deckId;
    });
  }

  @action
  void completeLesson(int deckId) {
    final deck = getDeckById(deckId);
    if (deck.lessonsCompleted < deck.totalLessons) {
      deck.lessonsCompleted++;
    }
  }
}
