// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Deck on _DeckBase, Store {
  final _$lessonsCompletedAtom = Atom(name: '_DeckBase.lessonsCompleted');

  @override
  int get lessonsCompleted {
    _$lessonsCompletedAtom.reportRead();
    return super.lessonsCompleted;
  }

  @override
  set lessonsCompleted(int value) {
    _$lessonsCompletedAtom.reportWrite(value, super.lessonsCompleted, () {
      super.lessonsCompleted = value;
    });
  }

  @override
  String toString() {
    return '''
lessonsCompleted: ${lessonsCompleted}
    ''';
  }
}
