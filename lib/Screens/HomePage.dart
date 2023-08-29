import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictacgame/OtherClass/Game.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State {
  String _activePlayer = 'c';
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
        child: Column(
          children: [
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
              style: const TextStyle(color: Colors.white, fontSize: 22,),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
