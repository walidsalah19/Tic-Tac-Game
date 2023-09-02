import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictacgame/OtherClass/Game.dart';
import 'package:tictacgame/OtherClass/Player.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State {
  String _activePlayer = 'x';
  bool _gameOver = false;
  bool _isSwitched = false;
  int _turn = 0;
  String _result = '';
  Game _game = Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child:(MediaQuery.of(context).orientation==Orientation.portrait)? Column(children: [
            ...firstBlock(),
            gridList(),
            ...secondBlock(),
          ]):Row(
            children: [
              Expanded(
                child: Column(children: [
                  ...firstBlock(),
                  ...secondBlock(),
                ]),
              ),
              gridList()
            ],
          ),
        ));
  }

  void onTap(int index) async {
    if (checkPlay(index).isEmpty) {
      _game.playGame(index, _activePlayer);
      updateOnTap(index);
      if (!_isSwitched && !_gameOver) {
        await _game.autoPlay(_activePlayer);
        updateOnTap(index);
      }
    }
  }

  void updateOnTap(int index) {
    setState(() {
      _activePlayer = (_activePlayer == "x") ? "y" : "x";
      var list = _game.checkWinner();
      _result = list[0];
      _gameOver = list[1];
      print("Game over  $_gameOver");
      if (_result.isNotEmpty) {
        _result = "The Winner is $_result";
      } else if (_gameOver && _result.isEmpty) {
        _result = "It's Draw";
      }
    });
  }

  String checkPlay(int index) {
    if (Player.playerx.contains(index)) {
      return "x";
    } else {
      if (Player.playery.contains(index)) {
        return "y";
      } else {
        return "";
      }
    }
  }

  void repeatGame() {
    _activePlayer = 'x';
    _gameOver = false;
    _isSwitched = false;
    _turn = 0;
    _result = '';
    Player.playery.clear();
    Player.playerx.clear();
  }

  List<Widget> secondBlock() {
    return [
      Text(
        _result,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        textAlign: TextAlign.center,
      ),
      ElevatedButton.icon(
        onPressed: () {
          setState(() {
            repeatGame();
          });
        },
        icon: const Icon(Icons.repeat),
        label: const Text("Repeat"),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).splashColor)),
      )
    ];
  }

  List<Widget> firstBlock() {
    return [
      SwitchListTile.adaptive(
          title: const Text(
            "Turn of/on two player",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          value: _isSwitched,
          onChanged: (bool value) {
            setState(() {
              _isSwitched = value;
            });
          }),
      Text(
        "It's $_activePlayer Turn",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        textAlign: TextAlign.center,
      )
    ];
  }

  Widget gridList() {
    return Expanded(
        child: GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      padding: const EdgeInsets.all(16),
      children: List.generate(
          9,
          (index) => InkWell(
                onTap: (_gameOver)
                    ? null
                    : () {
                        onTap(index);
                      },
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).splashColor,
                      borderRadius: BorderRadius.circular(18)),
                  child: Center(
                    child: Text(
                      checkPlay(index),
                      style: TextStyle(
                        color: (checkPlay(index) == "x")
                            ? Colors.blueAccent
                            : Colors.red,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )),
    ));
  }
}
