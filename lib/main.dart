import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Piedra, Papel o Tijeras',
      home: const Juego(),
    );
  }
}

class Juego extends StatefulWidget {
  const Juego({super.key});

  @override
  State<Juego> createState() => _JuegoState();
}

class _JuegoState extends State<Juego> {
  final List<String> _choices = ['rock', 'paper', 'scissors'];
  final Random _random = Random();

  String _player1 = 'rock';
  String _player2 = 'paper';
  String _result = 'EL jugador 2 ganoooo!!';

  void _play() {
    setState(() {
      _player1 = _choices[_random.nextInt(3)];
      _player2 = _choices[_random.nextInt(3)];

      if (_player1 == _player2) {
        _result = 'Empate!!';
      } else if ((_player1 == 'rock' && _player2 == 'scissors') ||
          (_player1 == 'paper' && _player2 == 'rock') ||
          (_player1 == 'scissors' && _player2 == 'paper')) {
        _result = 'EL jugador 1 ganoooo!!';
      } else {
        _result = 'EL jugador 2 ganoooo!!';
      }
    });
  }

  Widget _buildPlayer(String label, String choice, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          padding: const EdgeInsets.all(24),
          child: Image.asset('assets/$choice.png', fit: BoxFit.contain),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEEEEE),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Piedra, Papel o Tijeras',
          style: TextStyle(
            color: Color(0xFF999999),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPlayer('Jugador 1', _player1, const Color(0xFF6BB747)),
                _buildPlayer('Juegador 2', _player2, const Color(0xFFF7F052)),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              _result,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 280,
              height: 48,
              child: ElevatedButton(
                onPressed: _play,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD9534F),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Vamos!!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
