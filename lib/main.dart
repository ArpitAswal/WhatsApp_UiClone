import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_ui/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp UI Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
          primaryColor: const Color(0xFF128C7E), //teal green
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF075E54),),
      scaffoldBackgroundColor: Colors.white),
      home: const SplashScreen(),
      //const MyHomePage(title: 'WhatsApp'),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        'images/whatsapp_image.jpg',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
