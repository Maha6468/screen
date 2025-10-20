import 'package:flutter/material.dart';
import 'package:screen/practice/practice2.dart';

import 'coffeeHomePage/all_screen/home.dart';
import 'practice/coffehome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
     home:Home(),
     // home:CoffeeHomePage()
    );
  }
}
