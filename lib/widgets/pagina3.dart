import 'package:flutter/material.dart';

class ZaraScreen extends StatelessWidget {
  const ZaraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Contenedor para la caja de regalo con el osito
              SizedBox(
                width: 250,
                height: 300, // Aumentamos la altura para dar espacio al moño y al oso
                child: CustomPaint(
                  painter: GiftBoxWithBearPainter(),
                ),
              ),
              const SizedBox(height: 30),
              const Text("WELCOME", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
              const Text("to", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.grey)),
              const Text("ZARA", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100, letterSpacing: 8, color: Colors.black)),
              const SizedBox(height: 40),
              // Botones
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[300], // Color café claro
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text("Iniciar sesión", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF000080), // Azul Marino
                  shape: const RoundedRectangleBorder(), // Sin bordes redondeados
                  padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 15),
                ),
                child: const Text("Registrarse", style: TextStyle(color: Colors.white)),
              ),
               const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Clase para dibujar la caja de regalo y el oso
class GiftBoxWithBearPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintRed = Paint()..color = Colors.red..style = PaintingStyle.fill;
    final paintWhite = Paint()..color = Colors.white..style = PaintingStyle.fill;
    final paintBear = Paint()..color = const Color(0xFFC8A782)..style = PaintingStyle.fill; // Marrón del oso
    final paintBearDark = Paint()..color = const Color(0xFF8B6B4A)..style = PaintingStyle.fill; // Sombra/detalles oso
    final paintBlack = Paint()..color = Colors.black..style = PaintingStyle.fill;

    // --- DIBUJAR LA CAJA ---
    final boxRect = Rect.fromCenter(center: Offset(size.width / 2, size.height * 0.6), width: size.width * 0.7, height: size.height * 0.5);
    canvas.drawRect(boxRect, paintWhite);
    canvas.drawRect(boxRect, Paint()..color = Colors.black..style = PaintingStyle.stroke..strokeWidth = 1.5);

    // Rayas rojas (cinta)
    final verticalStripe = Rect.fromCenter(center: boxRect.center, width: 20, height: boxRect.height);
    final horizontalStripe = Rect.fromCenter(center: boxRect.center, width: boxRect.width, height: 20);
    canvas.drawRect(verticalStripe, paintRed);
    canvas.drawRect(horizontalStripe, paintRed);

    // --- DIBUJAR EL MOÑO ---
    final bowCenter = Offset(boxRect.center.dx, boxRect.top);
    final bowLoopPath = Path()
      ..moveTo(bowCenter.dx, bowCenter.dy)
      ..cubicTo(bowCenter.dx - 60, bowCenter.dy - 50, bowCenter.dx - 30, bowCenter.dy + 10, bowCenter.dx, bowCenter.dy) // Lazo izquierdo
      ..moveTo(bowCenter.dx, bowCenter.dy)
      ..cubicTo(bowCenter.dx + 60, bowCenter.dy - 50, bowCenter.dx + 30, bowCenter.dy + 10, bowCenter.dx, bowCenter.dy); // Lazo derecho
    canvas.drawPath(bowLoopPath, paintRed);
    canvas.drawCircle(bowCenter, 12, paintRed); // Nudo central

    // --- DIBUJAR EL OSITO ---
    final bearPeekAmount = 35.0;
    final bearCenter = Offset(boxRect.right - 25, boxRect.top - bearPeekAmount / 2);

    // Orejas
    canvas.drawCircle(Offset(bearCenter.dx - 20, bearCenter.dy - 15), 10, paintBear);
    canvas.drawCircle(Offset(bearCenter.dx + 20, bearCenter.dy - 15), 10, paintBear);
    canvas.drawCircle(Offset(bearCenter.dx - 20, bearCenter.dy - 15), 7, paintBearDark);
    canvas.drawCircle(Offset(bearCenter.dx + 20, bearCenter.dy - 15), 7, paintBearDark);

    // Cabeza
    canvas.drawCircle(bearCenter, 30, paintBear);

    // Hocico
    canvas.drawCircle(Offset(bearCenter.dx, bearCenter.dy + 10), 15, Paint()..color = Colors.white.withOpacity(0.8));

    // Ojos y nariz
    canvas.drawCircle(Offset(bearCenter.dx - 10, bearCenter.dy), 3, paintBlack); // Ojo izquierdo
    canvas.drawCircle(Offset(bearCenter.dx + 10, bearCenter.dy), 3, paintBlack); // Ojo derecho
    final nosePath = Path()
      ..moveTo(bearCenter.dx - 4, bearCenter.dy + 10)
      ..addOval(Rect.fromCenter(center: Offset(bearCenter.dx, bearCenter.dy + 8), width: 10, height: 7));
    canvas.drawPath(nosePath, paintBlack); // Nariz

    // Patitas sobre la caja
    final pawPath = Path()
      ..addOval(Rect.fromCenter(center: Offset(bearCenter.dx - 10, boxRect.top + 5), width: 20, height: 15))
      ..addOval(Rect.fromCenter(center: Offset(bearCenter.dx + 15, boxRect.top + 8), width: 20, height: 15));
    canvas.drawPath(pawPath, paintBear);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
