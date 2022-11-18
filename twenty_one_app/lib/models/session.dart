// Trae Brown & Grant Commodore

// Class that represents a game session
import 'user.dart';

class Session {
  User user;
  User computer;
  int games;
  int userScore;
  int computerScore;

  // Constructor for Session object.
  Session({
    required this.user,
    required this.computer,
    this.games = 1,
    this.userScore = 0,
    this.computerScore = 0,
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

  // Get the score of the user
  int getUserScore() {
    return userScore;
  }

  // Get the score of the computer
  int getComputerScore() {
    return computerScore;
  }

  // Increment the score of the user
  void incrementUserScore(int score) {
    userScore += score;
  }

  // Increment the score of the computer
  void incrementComputerScore(int score) {
    computerScore += score;
  }

  // Reset the score of the user
  void resetUserScore() {
    userScore = 0;
  }

  // Reset the score of the computer
  void resetComputerScore() {
    computerScore = 0;
  }
}
