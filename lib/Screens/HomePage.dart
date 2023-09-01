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
  String _result = 'cccccc';
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              padding: const EdgeInsets.all(16),
              children: List.generate(
                  9,
                  (index) =>InkWell(
                        onTap: (_gameOver)?null: () {onTap(index);},
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).splashColor,
                              borderRadius: BorderRadius.circular(18)),
                          child: const Center(
                            child: Text(
                              "X",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )),
            )),
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
                  _activePlayer = 'c';
                  _gameOver = false;
                  _isSwitched = false;
                  _turn = 0;
                  _result = 'bbbb';
                });
              },
              icon: const Icon(Icons.repeat),
              label: const Text("Repeat"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).splashColor)),
            )
          ],
        ),
      ),
    );
  }

  void onTap(int index) {
    _game.playGame(index,_activePlayer);
  }
}
