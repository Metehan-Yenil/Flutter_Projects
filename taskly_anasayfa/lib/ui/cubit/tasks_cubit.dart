import 'package:taskly_anasayfa/data/entity/tasks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly_anasayfa/data/repository/taskly_repository.dart';

class TaskCubit extends Cubit<List<Tasks>> {
  TaskCubit() : super([]);
  var trepo = TasklyRepository();
  Future<void> taskEkle(Tasks task) async {
    await trepo.taskEkle(task);

  }

  Future<void> taskleriYukle(int userId) async {
    final tasks = await trepo.taskleriGetir(userId);
    emit(tasks);
  }
}