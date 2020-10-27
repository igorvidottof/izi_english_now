import 'package:flutter/material.dart';
import 'package:izi_english_now/screens/lesson_categories_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBar(
            title: Text('Hello Learner!'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              LessonCategoriesScreen.routeName,
            ),
          ),
          Divider(color: Colors.black),
        ],
      ),
    );
  }
}
