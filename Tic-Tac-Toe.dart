import 'dart:io';

class TicTacToe {
  List<String> board;
  String currentPlayer;

  TicTacToe()
      : board = List.generate(9, (index) => (index + 1).toString()),
        currentPlayer = 'X';

  void printBoard() {
    print('${board[0]} | ${board[1]} | ${board[2]}\n'
        '---------\n'
        '${board[3]} | ${board[4]} | ${board[5]}\n'
        '---------\n'
        '${board[6]} | ${board[7]} | ${board[8]}\n');
  }

  bool makeMove(int position) {
    if (position < 1 ||
        position > 9 ||
        board[position - 1] == 'X' ||
        board[position - 1] == 'O') {
      print('Invalid move. Please enter a valid position (1-9) that is not taken.');
      return false;
    }

    board[position - 1] = currentPlayer;
    return true;
  }

  bool checkWin() {
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] == currentPlayer &&
          board[i * 3 + 1] == currentPlayer &&
          board[i * 3 + 2] == currentPlayer ||
          board[i] == currentPlayer &&
              board[i + 3] == currentPlayer &&
              board[i + 6] == currentPlayer) {
        return true;
      }
    }

    if (board[0] == currentPlayer &&
        board[4] == currentPlayer &&
        board[8] == currentPlayer ||
        board[2] == currentPlayer &&
            board[4] == currentPlayer &&
            board[6] == currentPlayer) {
      return true;
    }

    return false;
  }

  bool isBoardFull() {
    return !board.contains('1') &&
        !board.contains('2') &&
        !board.contains('3') &&
        !board.contains('4') &&
        !board.contains('5') &&
        !board.contains('6') &&
        !board.contains('7') &&
        !board.contains('8') &&
        !board.contains('9');
  }

  void switchPlayer() {
    currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
  }

  void play() {
    do {
      printBoard();
      print(
          'Player $currentPlayer, please enter the number of the square where you want to place your $currentPlayer:');
      int move = int.parse(stdin.readLineSync()!);

      if (makeMove(move)) {
        if (checkWin()) {
          printBoard();
          print('Player $currentPlayer wins!');
          break;
        } else if (isBoardFull()) {
          printBoard();
          print('It\'s a draw!');
          break;
        }

        switchPlayer();
      }
    } while (true);

    print('Do you want to play again? (yes/no)');
    String playAgain = stdin.readLineSync()!;
    if (playAgain.toLowerCase() == 'yes') {
      reset();
      play();
    } else {
      print('Thanks for playing!');
    }
  }

  void reset() {
    board = List.generate(9, (index) => (index + 1).toString());
    currentPlayer = 'X';
  }
}

void main() {
  TicTacToe game = TicTacToe();
  game.play();
}


