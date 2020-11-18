import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:izi_english_now/models/deck.dart';
import 'package:izi_english_now/models/deck_category.dart';
import 'package:izi_english_now/models/decks_mobx.dart';
import 'package:izi_english_now/screens/deck_screen.dart';
import 'package:izi_english_now/widgets/app_drawer.dart';

class DecksScreen extends StatelessWidget {
  static const routeName = '/decks';

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final decksMobx = GetIt.I.get<DecksMobx>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Curso'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                  ),
                ),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello learner,',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                        Chip(
                          avatar: Icon(
                            Icons.face,
                            color: primaryColor,
                          ),
                          label: Text(
                            'Você está no nível 6',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Observer(
                            builder: (_) {
                              return CircularProgressIndicator(
                                strokeWidth: 8,
                                value: decksMobx.getCourseCompletion(),
                                backgroundColor: Colors.white12,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Observer(
                                builder: (_) {
                                  return Text(
                                    '${(decksMobx.getCourseCompletion() * 100).toStringAsFixed(0)}%',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                    ),
                                  );
                                },
                              ),
                              const Text(
                                'completo',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: decksMobx.deckCategories.length,
                itemBuilder: (ctx, i) {
                  final deckCategory = decksMobx.deckCategories[i];
                  return DeckCategoryItem(
                    deckCategory: deckCategory,
                    key: ValueKey(deckCategory.id),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeckCategoryItem extends StatefulWidget {
  final DeckCategory deckCategory;

  const DeckCategoryItem({
    Key key,
    @required this.deckCategory,
  }) : super(key: key);

  @override
  _DeckCategoryItemState createState() => _DeckCategoryItemState();
}

class _DeckCategoryItemState extends State<DeckCategoryItem> {
  var _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 22,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('100%'),
                  ),
                ),
              ),
              title: Text(widget.deckCategory.title),
              subtitle: Text('Descrição da categoria'),
              trailing: IconButton(
                icon: _isExpanded
                    ? Icon(Icons.expand_less)
                    : Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ),
            if (_isExpanded)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.deckCategory.decks.length,
                itemBuilder: (ctx, i) {
                  return Column(
                    children: [
                      DeckItem(
                        deck: widget.deckCategory.decks[i],
                      ),
                      SizedBox(height: 4),
                    ],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class DeckItem extends StatelessWidget {
  final Deck deck;

  const DeckItem({Key key, this.deck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context).pushNamed(
          DeckScreen.routeName,
          arguments: deck.id,
        ),
        leading: Icon(Icons.book),
        title: Text(deck.title),
        trailing: Icon(Icons.keyboard_arrow_right),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2),
            Text(
              deck.description,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // DECK CATEGORY PROGRESS
                    child: Observer(
                      builder: (_) {
                        return FractionallySizedBox(
                          widthFactor:
                              deck.lessonsCompleted / deck.totalLessons,
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Observer(
                  builder: (_) {
                    return Text(
                      '${deck.lessonsCompleted}/${deck.totalLessons}',
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
