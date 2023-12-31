import 'dart:math';

import 'package:tictacgame/OtherClass/Player.dart';

class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == "x") {
      Player.playerx.add(index);
    } else {
      Player.playery.add(index);
    }
  }

  List<dynamic> checkWinner() {
    List<dynamic> list = [];
    bool end = false;
    String winner = "";
    if (Player.playerx.containAll(0, 1, 2) ||
        Player.playerx.containAll(3, 4, 5) ||
        Player.playerx.containAll(6, 7, 8) ||
        Player.playerx.containAll(0, 3, 6) ||
        Player.playerx.containAll(1, 4, 7) ||
        Player.playerx.containAll(2, 5, 8) ||
        Player.playerx.containAll(0, 4, 8) ||
        Player.playerx.containAll(2, 4, 6)) {
      winner = "x";
      end = true;
    } else if (Player.playery.containAll(0, 1, 2) ||
        Player.playery.containAll(3, 4, 5) ||
        Player.playery.containAll(6, 7, 8) ||
        Player.playery.containAll(0, 3, 6) ||
        Player.playery.containAll(1, 4, 7) ||
        Player.playery.containAll(2, 5, 8) ||
        Player.playery.containAll(0, 4, 8) ||
        Player.playery.containAll(2, 4, 6)) {
      winner = "y";
      end = true;
    }
    else if(Player.playery.length+Player.playerx.length==9)
      {
        end=true;
      }
    list.add(winner);
    list.add(end);
    return list;
  }

  Future<void> autoPlay(String activePlayer) async {
    List<int> auto = [];
    for (int i = 0; i < 9; i++) {
      if (!Player.playery.contains(i) && !Player.playerx.contains(i)) {
        auto.add(i);
      }
    }
    if (auto.isNotEmpty) {
      Random random = Random();
      int ranNumber = random.nextInt(auto.length);
      int select = 0;
      select = auto[ranNumber];
      playGame(select, activePlayer);
    }
  }
}

extension ContainAll on List {
  containAll(int x, int y, [z]) {
    return (z == null)
        ? contains(x) && contains(y)
        : contains(x) && contains(y) && contains(z);
  }
}
