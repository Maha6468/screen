import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.baby_changing_station),
              title: Text("Qahwa",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle:Text("Space"),
              trailing: Icon(Icons.shopping_bag_outlined),
            ),
           // SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Smooth Out \nYour Everyday",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 30),),
            ),
           // SizedBox(height: 5),


            Flexible(
              flex: 2,
              child: ClipPath(
                clipper: TopCurveClipper(),
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFF1E4D2B),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     // _buildCategoryRowAlongCurve(context),


                      Stack(
                        children: [
                          Positioned(
                            bottom: -50,
                            top: -10,
                            left: 10,
                            child: _buildCategoryItem("☕", "HOT COFFEE"),
                          ),
                          Align(
                            alignment: const Alignment(-0.3, -0.2),
                            child: _buildCategoryItem("🥤", "DRINKS"),
                          ),
                          Align(
                            alignment: const Alignment(0.3, -0.2),
                            child: _buildCategoryItem("🍵", "HOT TEAS"),
                          ),
                          Align(
                            alignment: const Alignment(0.8, 0.2),
                            child: _buildCategoryItem("🧁", "BAKERY"),
                          ),








                        ],
                      ),



                      Image.asset(
                        "assets/images/img.png",
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      //const SizedBox(height: 10),
                      const Text(
                        "Caramel \nFrappuccino",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
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
    path.lineTo(0, 90);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      90,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



Widget _buildCategoryItem(String icon, String title) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: Text(icon, style: const TextStyle(fontSize: 22)),
      ),
      const SizedBox(height: 5),
      Text(
        title,
        style: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white
        ),
      ),
    ],
  );
}
