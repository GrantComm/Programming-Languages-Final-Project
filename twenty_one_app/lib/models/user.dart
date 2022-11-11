// Class that represents a user
class User {
  String name;
  int totalScore;
  int totalGames;
  int totalWins;

  // Constructor for User object.
  User(
      {required this.name,
      this.totalScore = 0,
      this.totalGames = 1,
      this.totalWins = 0});

  // Get the user's name
  String getName() {
    return name;
  }

  // Get the user's total score
  int getTotalScore() {
    return totalScore;
  }

  // Get the user's total games
  int getTotalGames() {
    return totalGames;
  }

  // Get the user's total wins
  int getTotalWins() {
    return totalWins;
  }
}
