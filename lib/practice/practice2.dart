import 'package:flutter/material.dart';
import 'dart:math' as math;

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E6),
      body: SafeArea(
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.coffee, color: Colors.brown),
              title: Text("Qahwa", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Space"),
              trailing: Icon(Icons.shopping_bag_outlined, color: Colors.brown),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Smooth Out \nYour Everyday",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🍃 এখানে আসল curved green container
            Expanded(
              child: ClipPath(
                clipper: TopCurveClipper(),
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFF1E4D2B),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/frappuccino.png",
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Caramel Frappuccino",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "\$30.00",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 80); // উপরের দিক থেকে curve শুরু হবে
    path.quadraticBezierTo(
      size.width / 2,
      0, // মধ্যবিন্দু (smooth arc)
      size.width,
      80,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
