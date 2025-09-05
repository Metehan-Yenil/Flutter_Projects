import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly_anasayfa/data/repository/taskly_repository.dart';
import 'package:taskly_anasayfa/data/entity/users.dart';

class AnasayfaCubit extends Cubit<void> {
  final TasklyRepository _tasklyRepository;

  AnasayfaCubit(this._tasklyRepository) : super(null);


}