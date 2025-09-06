import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:taskly_anasayfa/ui/cubit/session_cubit.dart';

class Profil extends StatefulWidget {

  const Profil({super.key});


  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  @override
  Widget build(BuildContext context) {
    final sessionState= context.watch<SessionCubit>().state;
    final user= sessionState.user;

    if (user != null){
      final username= user.username;
      final email= user.email;
      final password= user.password;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://www.example.com/profile_image.jpg',
              ),
            ),
            const SizedBox(height: 20),
             Text(
              user?.username ?? 'kullanıcı adı',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              user?.email ?? 'kullanici@email.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              user != null ? '*' * user.password.length : 'şifreniz',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Geri'),
              onPressed: () {
                Navigator.pop(context); // bir sayga geri
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text('Anasayfa'),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/anasayfa',
                      (route) => false,
                );
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.exit_to_app),
              label: const Text('Çıkış yap'),
              onPressed: () {
                context.read<SessionCubit>().clearUser();
                Navigator.pushReplacementNamed(
                    context, '/login');



              },
            ),
          ],
        ),
      ),
    );
  }
}