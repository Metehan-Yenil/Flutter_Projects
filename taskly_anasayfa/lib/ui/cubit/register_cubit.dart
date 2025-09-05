import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly_anasayfa/data/repository/taskly_repository.dart';
import 'package:taskly_anasayfa/data/entity/users.dart';

class RegisterCubit extends Cubit<void> {
  RegisterCubit() : super(null);
  var trepo= TasklyRepository();

  Future<void> kaydet(String username, String email, String password) async {
    trepo.kaydet(username, email, password);
  }


}