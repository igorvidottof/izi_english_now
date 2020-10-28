import 'package:flutter/material.dart';
import 'package:izi_english_now/screens/decks_screen.dart';

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
          AppDrawerItem(
            title: 'Home',
            icon: Icons.home,
            routeName: DecksScreen.routeName,
          ),
        ],
      ),
    );
  }
}

class AppDrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routeName;

  const AppDrawerItem({
    Key key,
    this.title,
    this.icon,
    this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemColor = Colors.grey.shade600;
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pushReplacementNamed(
            routeName,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(icon, color: itemColor),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: itemColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(height: 0, color: Colors.grey),
      ],
    );
  }
}
