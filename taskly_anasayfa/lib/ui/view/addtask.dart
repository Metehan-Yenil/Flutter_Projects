import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly_anasayfa/data/entity/tasks.dart';
import 'package:taskly_anasayfa/ui/cubit/session_cubit.dart';
import 'package:taskly_anasayfa/ui/cubit/tasks_cubit.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  DateTime? dueDate;

  @override
  Widget build(BuildContext context) {
    final sessionState= context.watch<SessionCubit>().state;
    final user= sessionState.user;

    if (user != null){
      final username= user.username;
      final email= user.email;
      final password= user.password;
      final user_id= user.user_id;
    }
    return  Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController, decoration: InputDecoration(labelText: "Başlık giriniz"),

            ),
            TextField(controller: descController, decoration: InputDecoration(labelText: "Açıklama giriniz"),),
            ElevatedButton(
                onPressed: () async {
                  if (user== null) return;
              dueDate = DateTime.now().add(Duration(days: 1)); //ör tarih
                  final newTask = Tasks(userId: user.user_id!  ,
                      title: titleController.text.trim(),
                      description: descController.text.trim(),
                      isCompleted: false,
                      dueDate: dueDate!);
                  context.read<TaskCubit>().taskEkle(newTask);
                  Navigator.pop(context);
            }, child: Text("Kaydet"), )
          ],

        ),
      ),
    );
  }
}
