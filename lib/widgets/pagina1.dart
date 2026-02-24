import 'package:flutter/material.dart';
class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // Navegación al deslizar hacia arriba o hacer click
        onVerticalDragUpdate: (details) {
          if (details.delta.dy < -10) Navigator.pushNamed(context, '/home');
        },
        onTap: () => Navigator.pushNamed(context, '/home'),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.pinkAccent, Colors.purple],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              const Text(
                'Sunday, May 20',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 20),
              const Text(
                '12:12',
                style: TextStyle(
                    fontSize: 80, fontWeight: FontWeight.w300, color: Colors.white),
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 40),
              const Text("Desliza hacia arriba", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}