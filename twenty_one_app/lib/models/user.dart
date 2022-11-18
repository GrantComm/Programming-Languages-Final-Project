// Trae Brown & Grant Commodore

// Class that represents a user
class User {
  String name;
  int totalGames;
  int totalWins;
  int totalLosses;
  int totalTies;

  // Constructor for User object.
  User(
      {required this.name,
      this.totalGames = 1,
      this.totalWins = 0,
      this.totalLosses = 0,
      this.totalTies = 0});

  // Get the user's name
  String getName() {
    return name;
  }

  // Get the user's total games
  int getTotalGames() {
    return totalGames;
  }

  // Get the user's total wins
  int getTotalWins() {
    return totalWins;
  }

  // Set the user's total wins
  void incrementTotalWins() {
    totalWins++;
  }

  // Set the user's total losses
  void incrementTotalLosses() {
    totalLosses++;
  }

  // Get the user's total losses
  int getTotalLosses() {
    return totalLosses;
  }

  // Set the user's total ties
  void incrementTotalTies() {
    totalTies++;
  }

  // Get the user's total ties
  int getTotalTies() {
    return totalTies;
  }
}
