import 'package:izi_english_now/models/deck.dart';

class DeckCategory {
  final int id;
  final String title;
  final List<Deck> decks;

  DeckCategory(this.id, this.title, this.decks);
}
