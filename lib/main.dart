import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:izi_english_now/screens/lesson_categories_screen.dart';

void main() {
  GetIt getIt = GetIt.I;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'LilitaOne',
        chipTheme:
            ChipTheme.of(context).copyWith(backgroundColor: Colors.white),
      ),
      home: LessonCategoriesScreen(),
      routes: {
        LessonCategoriesScreen.routeName: (ctx) => LessonCategoriesScreen(),
      },
    );
  }
}
