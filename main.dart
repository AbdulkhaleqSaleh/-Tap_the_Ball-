import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(TapTheBallGame());
}

class TapTheBallGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap the Ball',
      debugShowCheckedModeBanner: false,
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double ballX = 0;
  double ballY = 0;
  int score = 0;

  void _moveBall() {
    final random = Random();
    setState(() {
      ballX = (random.nextDouble() * 2) - 1;
      ballY = (random.nextDouble() * 2) - 1;
      score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.9),
            child: Text(
              'Score: \$score',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Align(
            alignment: Alignment(ballX, ballY),
            child: GestureDetector(
              onTap: _moveBall,
              child: Image.asset('assets/ball.png', width: 80, height: 80),
            ),
          ),
        ],
      ),
    );
  }
}
