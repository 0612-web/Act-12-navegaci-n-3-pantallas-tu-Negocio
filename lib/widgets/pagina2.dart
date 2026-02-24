import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Column(
          children: [
            // Status Bar simulada
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("12:12", style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(Icons.wifi, size: 18),
                      SizedBox(width: 5),
                      Icon(Icons.signal_cellular_4_bar, size: 18),
                      SizedBox(width: 5),
                      Icon(Icons.battery_full, size: 18),
                    ],
                  )
                ],
              ),
            ),
            // Barra de búsqueda Google
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text("Google", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            // Grid de Aplicaciones (3 Columnas)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Columna 1
                  Expanded(
                    child: _buildAppColumn([
                      const AppIcon(icon: Icons.music_note, label: "Spotify", color: Colors.green),
                      const AppIcon(icon: Icons.messenger, label: "Messenger", color: Colors.blue),
                      const AppIcon(icon: Icons.play_circle_fill, label: "YouTube", color: Colors.red),
                      const AppIcon(icon: Icons.vpn_key, label: "Llavero", color: Colors.grey),
                    ]),
                  ),
                  // Columna 2
                  Expanded(
                    child: _buildAppColumn([
                      const AppIcon(icon: Icons.mail, label: "Mail", color: Colors.blueAccent),
                      const AppIcon(icon: Icons.facebook, label: "Facebook", color: Colors.indigo),
                      const AppIcon(icon: Icons.cloud, label: "Clima", color: Colors.lightBlue),
                      const AppIcon(icon: Icons.email, label: "Gmail", color: Colors.redAccent),
                      // Icono del Osito (Botón a Página 3)
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/zara'),
                        child: const Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: Text("🐻", style: TextStyle(fontSize: 25)),
                            ),
                            SizedBox(height: 4),
                            Text("Osito", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  // Columna 3
                  Expanded(
                    child: _buildAppColumn([
                      const AppIcon(icon: Icons.search, label: "Google", color: Colors.orange),
                      const AppIcon(icon: Icons.camera_alt, label: "Instagram", color: Colors.purple),
                      const AppIcon(icon: Icons.camera, label: "Cámara", color: Colors.blueGrey),
                      const AppIcon(icon: Icons.shop, label: "Play Store", color: Colors.green),
                    ]),
                  ),
                ],
              ),
            ),
            // Dock Inferior
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.phone, size: 30, color: Colors.green),
                  Icon(CupertinoIcons.photo_on_rectangle, size: 30, color: Colors.purple),
                  Icon(Icons.camera_alt, size: 30, color: Colors.grey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppColumn(List<Widget> children) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: children.map((w) => Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: w)).toList(),
      ),
    );
  }
}

class AppIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const AppIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 20,
          child: Icon(icon, color: Colors.white, size: 25),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
