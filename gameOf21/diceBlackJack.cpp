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

Dice rollDice(Dice&);
void runComputerTurn(Dice&, int&);
void runPlayerTurn(Dice&, int&);
void startGame(Dice&, int&, int&);
int getDiceTotal(Dice);
void displayTotals(int, int);
void checkWinner(int, int);

int main()
{
    srand(time(NULL));
    Dice gameDice;
    int userTotal;
    int computerTotal;

    cout << "\nWelcome to the game of 21!\n";
    cout << "Instead of cards, there are two six-sided dice" << endl;
    cout << "First the computer rolls, and then the user" << endl;
    cout << "Both totals are displayed, and then the user has the option to roll the dice." << endl;
    cout << "If the user exceeds 21, the computer wins." << endl;
    cout << "If the user rolls a total of 21, the user wins." << endl;

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
    compTotal = 0;
    userTotal = 0;

    // Roll the dice for the computer
    compTotal = getDiceTotal(rollDice(dice));

    // Roll the dice for the user
    userTotal = getDiceTotal(rollDice(dice));

    // Display the totals
    cout << "\nYou rolled a total of " << userTotal << endl;
}

void runPlayerTurn(Dice& dice, int& userTotal)
{
    cout << "Would you like to roll the dice? (y/n): ";
    char userChoice;
    cin >> userChoice;

    // If the user chooses to roll the dice
    while (userChoice == 'y' || userChoice == 'Y')
    {
        // Roll the dice
        rollDice(dice);
        cout << "\nYou rolled a " << dice.die1 << " and a " << dice.die2 << endl;
        // Get the total of the dice
        userTotal += getDiceTotal(dice);
        // Display the total
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

    cout << "\nYour total is " << userTotal << endl;
}

Dice rollDice(Dice& dice)
{
    dice.die1 = rand() % 6 + 1;
    dice.die2 = rand() % 6 + 1;
    return dice;
}

int getDiceTotal(Dice dice)
{
    return dice.die1 + dice.die2;
}

void runComputerTurn(Dice& dice, int& total)
{
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
        else if (total > 17)
        {
            cout << "The computer will not roll again." << endl;
        }
    }
}

void displayTotals(int userTotal, int compTotal)
{
    cout << "\nYour total is " << userTotal << endl;
    cout << "The computer's total is " << compTotal << endl;
}

void checkWinner(int userTotal, int compTotal)
{
    displayTotals(userTotal, compTotal);
    if (userTotal > compTotal && userTotal <= 21)
    {
        cout << "You win!" << endl;
    }
    else if (compTotal > userTotal && compTotal <= 21)
    {
        cout << "You lose!" << endl;
    }
    else if (userTotal == compTotal)
    {
        cout << "It's a tie!" << endl;
    }
}