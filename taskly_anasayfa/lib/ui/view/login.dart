import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskly_anasayfa/ui/cubit/session_cubit.dart';
import 'package:taskly_anasayfa/ui/view/anasayfa.dart';
import 'package:taskly_anasayfa/ui/view/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly_anasayfa/ui/cubit/login_cubit.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: const FractionalOffset(0.5, 0.3),
            child: Container(
              width: 350,
              height: 370,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                alignment: const Alignment(0, -0.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: emailController,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email veya Kullanıcı Adı',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'şifre',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(200, 45),
                      ),
                      onPressed: () async{
                        final sessionCubit = context.read<SessionCubit>();

                          final user= await loginCubit.login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                          if(user != null){
                            await sessionCubit.setUser(user);
                            if (!mounted) return;

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Giriş başarılı')),
                            );
                            Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (_)=> Anasayfa(usernameDb: user.username),
                            ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Giriş başarısız, lütfen bilgilerinizi kontrol edin.')),
                            );
                          }
                      },
                      child: const Text(
                        'Giriş Yap',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                          },
                          child: const Text(
                            'Hesap oluşturun',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            // Şifremi unuttum sayfası
                          },
                          child: const Text(
                            'Şifremi unuttum',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}