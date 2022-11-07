#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

// This program plays a game of 21 with the user
// Instead of cards, there are two six-sided dice
// The user and the computer each roll two dice
// The player with the highest total wins

struct Dice {
    int die1;
    int die2;
};

// Function prototypes

// rollDice returns a random number between 1 and 6 for each die
Dice rollDice(Dice&);
// runComputerTurn executes the computer's turn
void runComputerTurn(Dice&, int&);
// runPlayerTurn executes the player's turn
void runPlayerTurn(Dice&, int&);
// startGame starts the game
void startGame(Dice&, int&, int&);
// getDiceTotal returns the total of the dice
int getDiceTotal(Dice);
// displayTotal displays the total of the dice
void displayTotals(int, int);
// checkWinner checks to see if there is a winner
void checkWinner(int, int);

int main()
{
    // Declare variables
    srand(time(NULL));
    Dice gameDice;
    int userTotal;
    int computerTotal;

    // Display the game title and instructions
    cout << "\nWelcome to the game of 21!\n";
    cout << "Instead of cards, there are two six-sided dice" << endl;
    cout << "First the user rolls, and then the computer" << endl;
    cout << "The user's total is displayed, and then the user has the option to roll the dice." << endl;
    cout << "If the user exceeds 21, the computer wins." << endl;
    cout << "If the user rolls a total of 21, the user wins." << endl;
    cout << "If neither player goes over 21 and if they each are unable to get exactly 21, the player with the highest total wins." << endl;

    // Start the game
    startGame(gameDice, userTotal, computerTotal);

    // Run the player's turn
    runPlayerTurn(gameDice, userTotal);

    if (userTotal < 21) {
        // Run the computer's turn
        runComputerTurn(gameDice, computerTotal);
    }

    // Check the winner
    checkWinner(userTotal, computerTotal);
}

void startGame(Dice& dice, int& userTotal, int& compTotal)
{
    // set the dice to zero
    compTotal = 0;
    userTotal = 0;

    // Roll the dice for the computer
    compTotal = getDiceTotal(rollDice(dice));

    // Roll the dice for the user
    userTotal = getDiceTotal(rollDice(dice));

    // Display the user's total
    cout << "\nYou rolled a total of " << userTotal << endl;
}

void runPlayerTurn(Dice& dice, int& userTotal)
{
    // Prompt the user to roll the dice
    cout << "Would you like to roll the dice? (y/n): ";
    char userChoice;
    cin >> userChoice;

    // If the user chooses to roll the dice
    while (userChoice == 'y' || userChoice == 'Y')
    {
        // Roll the dice
        rollDice(dice);
        // Display the dice values
        cout << "\nYou rolled a " << dice.die1 << " and a " << dice.die2 << endl;
        // Get the total of the dice
        userTotal += getDiceTotal(dice);
        // Display the new total
        cout << "Your new total is " << userTotal << endl;
        // If the user total is greater than 21, the computer wins
        if (userTotal > 21)
        {
            cout << "You lose!" << endl;
            break;
        }
        // If the user total is 21, the user wins
        else if (userTotal == 21)
        {
            cout << "You win!" << endl;
            break;
        }
        // If the user total is less than 21, ask if they want to roll again
        else
        {
            cout << "Would you like to roll again? (y/n): ";
            cin >> userChoice;
        }
    }

    // If the user chooses not to roll the dice, display the user total
    cout << "\nYour total is " << userTotal << endl;
}

Dice rollDice(Dice& dice)
{
    // Roll the dice
    dice.die1 = rand() % 6 + 1;
    dice.die2 = rand() % 6 + 1;
    // Return the dice
    return dice;
}

int getDiceTotal(Dice dice)
{
    // Return the total of the dice
    return dice.die1 + dice.die2;
}

void runComputerTurn(Dice& dice, int& total)
{
    // Begin the computer's turn
    cout << "\nThe computer is rolling the dice..." << endl;

    // Roll the dice
    dice = rollDice(dice);
    total = dice.die1 + dice.die2;

    // Display the dice
    cout << "The computer rolled a " << dice.die1 << " and a " << dice.die2 << endl;
    cout << "The computer's total is " << total << endl;

    // If the computer total is less than 21, roll again
    while (total <= 17)
    {
        // Roll the dice
        dice = rollDice(dice);
        total += dice.die1 + dice.die2;
        // Display the dice
        cout << "\nThe computer rolled a " << dice.die1 << " and a " << dice.die2 << endl;
        cout << "The computer's total is " << total << endl;
    
        // If the computer total is greater than 21, the user wins
        if (total > 21)
        {
            cout << "You win!" << endl;
            break;
        }
        // If the computer total is 21, the computer wins
        else if (total == 21)
        {
            cout << "You lose!" << endl;
            break;
        }
        // If the computer total is greater than 17, the computer stops rolling
        else if (total > 17)
        {
            cout << "The computer will not roll again." << endl;
        }
    }
}

void displayTotals(int userTotal, int compTotal)
{
    // Display the user total
    cout << "\nYour total is " << userTotal << endl;
    // Display the computer total
    cout << "The computer's total is " << compTotal << endl;
}

void checkWinner(int userTotal, int compTotal)
{
    // If the user total is greater than the computer total, the user wins
    displayTotals(userTotal, compTotal);
    if (userTotal > compTotal && userTotal <= 21)
    {
        cout << "You win!" << endl;
    }
    // If the computer total is greater than the user total, the computer wins
    else if (compTotal > userTotal && compTotal <= 21)
    {
        cout << "You lose!" << endl;
    }
    // If the user total is equal to the computer total, it is a tie
    else if (userTotal == compTotal)
    {
        cout << "It's a tie!" << endl;
    }
}