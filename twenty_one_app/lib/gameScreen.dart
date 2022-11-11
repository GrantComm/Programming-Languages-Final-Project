// Screen that is shown when a game is started

import 'package:flutter/material.dart';
import '../models/session.dart';
import '../models/user.dart';

class GameScreen extends StatefulWidget {
  Session gameSession;
  GameScreen({super.key, required this.gameSession});

  @override
  State<GameScreen> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Game: " + widget.gameSession.getGames().toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
