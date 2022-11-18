// Trae Brown & Grant Commodore

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:twenty_one_app/summaryScreen.dart';
import '../models/session.dart';
import '../models/user.dart';
import 'package:dice_icons/dice_icons.dart';

// Screen that is shown when a game is started
class GameScreen extends StatefulWidget {
  var dice = [
    DiceIcons.dice0,
    DiceIcons.dice1,
    DiceIcons.dice2,
    DiceIcons.dice3,
    DiceIcons.dice4,
    DiceIcons.dice5,
    DiceIcons.dice6
  ];
  var dice1Value = 0;
  var dice2Value = 0;
  var computerDice1Value = 0;
  var computerDice2Value = 0;
  String currentAction = '';
  String currentUserAction = '';
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
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 5,
                    right: MediaQuery.of(context).size.width / 5,
                    top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        widget.dice[widget.dice1Value],
                        size: 100,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          widget.dice[widget.dice2Value],
                          size: 100,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 4,
                  right: MediaQuery.of(context).size.width / 4,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).secondaryHeaderColor),
                            elevation: MaterialStateProperty.all<double>(5.0)),
                        onPressed: () {
                          _shuffleDice();
                          _computerAction();
                          _checkStatus();
                        },
                        child: const Text('Roll',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).secondaryHeaderColor),
                            elevation: MaterialStateProperty.all<double>(5.0)),
                        onPressed: () {
                          _userStand();
                          _computerAction();
                          _checkStatus();
                        },
                        child: const Text('Stand',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 15,
                  right: MediaQuery.of(context).size.width / 15,
                ),
                child: Text(widget.currentUserAction,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 15,
                  right: MediaQuery.of(context).size.width / 15,
                ),
                child: Text(widget.currentAction,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 5,
                    right: MediaQuery.of(context).size.width / 5,
                    top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text(
                            widget.gameSession.getUser().getName(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Score: ${widget.gameSession.getUserScore()}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text(
                            widget.gameSession.getComputer().getName(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Score: ${widget.gameSession.getComputerScore()}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Shuffle the dice for the user.
  void _shuffleDice() {
    setState(() {
      widget.dice1Value = Random().nextInt(6) + 1;
      widget.dice2Value = Random().nextInt(6) + 1;
      widget.gameSession
          .incrementUserScore(widget.dice1Value + widget.dice2Value);
      widget.currentUserAction =
          'You just rolled a ${widget.dice1Value + widget.dice2Value}!';
    });
  }

  // Stand button is pressed.
  void _userStand() {
    setState(() {
      widget.currentUserAction = 'You just chose to stand.';
    });
  }

  // Shuffle the dice for the computer.
  void _computerShuffleDice() {
    setState(() {
      widget.computerDice1Value = Random().nextInt(6) + 1;
      widget.computerDice2Value = Random().nextInt(6) + 1;
      widget.gameSession.incrementComputerScore(
          widget.computerDice1Value + widget.computerDice2Value);
      widget.currentAction =
          'The computer rolled a ${widget.computerDice1Value + widget.computerDice2Value}!';
    });
  }

  // Start another game.
  void _startAnotherGame() {
    setState(() {
      widget.gameSession.incrementGames();
    });
  }

  // Randomize the computer's actions.
  void _computerAction() {
    setState(() {
      int currentCompterScore = widget.gameSession.getComputerScore();
      if (currentCompterScore < 20) {
        if (currentCompterScore <= 12) {
          _computerShuffleDice();
        } else {
          int random = Random().nextInt(2);
          if (random == 0) {
            _computerShuffleDice();
          } else {
            widget.currentAction = 'The computer chose to stand.';
          }
        }
      } else {
        widget.currentAction = 'The computer chose to stand.';
      }
    });
  }

  // Check if there is a winner.
  void _checkStatus() {
    if (widget.gameSession.getUserScore() > 21) {
      widget.gameSession.getComputer().incrementTotalWins();
      widget.gameSession.getUser().incrementTotalLosses();
      _showPopup('You lost!', context);
    } else if (widget.gameSession.getComputerScore() == 21) {
      widget.gameSession.getComputer().incrementTotalWins();
      widget.gameSession.getUser().incrementTotalLosses();
      _showPopup('You lost!', context);
    } else if (widget.gameSession.getUserScore() ==
            widget.gameSession.getComputerScore() &&
        widget.gameSession.getUserScore() == 21) {
      widget.gameSession.getComputer().incrementTotalTies();
      widget.gameSession.getUser().incrementTotalTies();
      _showPopup('It is a tie', context);
    } else if (widget.gameSession.getComputerScore() > 21) {
      widget.gameSession.getComputer().incrementTotalLosses();
      widget.gameSession.getUser().incrementTotalWins();
      _showPopup('You won!', context);
    } else if (widget.gameSession.getUserScore() == 21) {
      widget.gameSession.getComputer().incrementTotalLosses();
      widget.gameSession.getUser().incrementTotalWins();
      _showPopup('You won!', context);
    }
  }

  _showPopup(String result, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Game Over",
              textAlign: TextAlign.center,
            ),
            content: Text(
              result,
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                child: const Text("New Game"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    widget.currentUserAction = '';
                    widget.currentAction = '';
                    widget.dice1Value = 0;
                    widget.dice2Value = 0;
                    widget.computerDice1Value = 0;
                    widget.computerDice2Value = 0;
                    widget.gameSession.resetUserScore();
                    widget.gameSession.resetComputerScore();
                    widget.gameSession.incrementGames();
                  });
                },
              ),
              ElevatedButton(
                child: const Text("End Session"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SummaryScreen(
                      gameSession: widget.gameSession,
                    );
                  }));
                },
              )
            ],
          );
        });
  }
}
