import 'package:flutter/material.dart';
import 'package:teste_flutter/widgets/category_selector.dart';
import 'package:teste_flutter/widgets/favorite_contacts.dart';
import 'package:teste_flutter/widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(100),
          child:  Text('Chats', style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          )
        ),
      ),
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
        icon: Icon(Icons.search),
        iconSize: 30,
        color: Colors.white,
        onPressed: () {},
         )
      ],
      leading: IconButton(
        icon: Icon(Icons.menu),
        iconSize: 30,
        color: Colors.white,
        onPressed: () {},
         ),
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                  ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}