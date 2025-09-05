import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly_anasayfa/ui/cubit/login_cubit.dart';
import 'package:taskly_anasayfa/ui/cubit/register_cubit.dart';
import 'package:taskly_anasayfa/ui/view/anasayfa.dart';
import 'package:taskly_anasayfa/ui/view/calendar.dart';
import 'package:taskly_anasayfa/ui/view/login.dart';
import 'package:taskly_anasayfa/ui/view/profil.dart';
import 'package:taskly_anasayfa/ui/view/register.dart';
import 'package:taskly_anasayfa/ui/view/simple_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: MaterialApp(
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
        home: const Anasayfa(),
      ),
    );
  }
}

