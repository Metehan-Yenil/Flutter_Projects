import 'package:flutter/material.dart';
import 'package:taskly_anasayfa/anasayfa.dart';
import 'package:taskly_anasayfa/calendar.dart';
import 'package:taskly_anasayfa/login.dart';
import 'package:taskly_anasayfa/profil.dart';
import 'package:taskly_anasayfa/register.dart';
import 'package:taskly_anasayfa/simple_calculator.dart';

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
      initialRoute: '/',
      routes: {

        '/anasayfa': (context) => const Anasayfa(),
        '/profil': (context) => const Profil(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/calendar': (context) => const Calendar(),

      },
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Calculator(),
    );
  }
}

