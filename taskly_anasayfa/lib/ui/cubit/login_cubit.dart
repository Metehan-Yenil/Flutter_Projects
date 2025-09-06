import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly_anasayfa/data/repository/taskly_repository.dart';
import 'package:taskly_anasayfa/data/entity/users.dart';

class LoginCubit extends Cubit<void> {
  LoginCubit() : super(null);
  var trepo= TasklyRepository();

  Future<Users?> login(String email, String password) {
   return trepo.girisyap(email, password);
  }


  Future<String?> fetchUsername(String email) async {
   return trepo.kullaniciadiCek(email);
  }


}