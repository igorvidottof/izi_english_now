import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:izi_english_now/models/decks_mobx.dart';

class DeckScreen extends StatelessWidget {
  static const routeName = '/deck';

  @override
  Widget build(BuildContext context) {
    final decksMobx = GetIt.I.get<DecksMobx>();
    final deck = decksMobx.getDeckById(
      ModalRoute.of(context).settings.arguments as int,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(deck.title),
      ),
      body: Center(
        child: Text(deck.title),
      ),
    );
  }
}
