import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly_anasayfa/data/repository/taskly_repository.dart';
import 'package:taskly_anasayfa/data/entity/users.dart';

class LoginCubit extends Cubit<void> {
  LoginCubit() : super(null);
  var trepo= TasklyRepository();

  Future<void> login(String email, String password) async {
    trepo.girisyap(email, password);
  }


}