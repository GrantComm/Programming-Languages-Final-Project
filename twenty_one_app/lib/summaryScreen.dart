// Trae Brown & Grant Commodore
import 'package:flutter/material.dart';
import 'package:twenty_one_app/startScreen.dart';

import 'models/session.dart';

// Screen that is shown when the game session is over.
class SummaryScreen extends StatelessWidget {
  Session gameSession;
  SummaryScreen({super.key, required this.gameSession});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Game Session Summary',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Text('User: ${gameSession.getUser().getName()}',
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(
              'Record: ${gameSession.getUser().getTotalWins()} wins, ${gameSession.getUser().getTotalLosses()} losses, ${gameSession.getUser().getTotalTies()} ties',
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('User: ${gameSession.getComputer().getName()}',
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(
              'Record: ${gameSession.getComputer().getTotalWins()} wins, ${gameSession.getComputer().getTotalLosses()} losses, ${gameSession.getComputer().getTotalTies()} ties',
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 4,
                right: MediaQuery.of(context).size.width / 4),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).secondaryHeaderColor),
                  elevation: MaterialStateProperty.all<double>(5.0)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const StartScreen();
                }));
              },
              child: const Text('End Game Session',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
