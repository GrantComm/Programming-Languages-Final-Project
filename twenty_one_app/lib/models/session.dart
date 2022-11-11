// Class that represents a game session
import 'user.dart';

class Session {
  User user;
  User computer;
  int games;

  // Constructor for Session object.
  Session({
    required this.user,
    required this.computer,
    this.games = 1,
  });

  // Get the user
  User getUser() {
    return user;
  }

  // Get the computer
  User getComputer() {
    return computer;
  }

  // Get the number of games
  int getGames() {
    return games;
  }

  // Increment the number of games
  void incrementGames() {
    games++;
  }
}
