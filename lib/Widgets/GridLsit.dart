

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridList{
  static Widget gridList()
  {
    return  Expanded(
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