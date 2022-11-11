// Screen that is shown when the app is started

import 'package:flutter/material.dart';
import 'package:twenty_one_app/gameScreen.dart';
import 'package:twenty_one_app/models/session.dart';
import 'package:twenty_one_app/models/user.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _userName = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Twenty One',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 15,
            bottom: MediaQuery.of(context).size.height / 8,
            left: MediaQuery.of(context).size.height / 50,
            right: MediaQuery.of(context).size.height / 50),
        child: Center(
          child: Column(
            children: [
              const Text('Welcome to Twenty One!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                child: Image.asset('images/dice.png'),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 15,
                child: TextFormField(
                  controller: _userName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
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
                    if (_userName.text.isNotEmpty) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GameScreen(
                          gameSession: new Session(
                              user: new User(name: _userName.text),
                              computer: new User(name: "Computer")),
                        );
                      }));
                    }
                  },
                  child: const Text('Start Game',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
