import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskly_anasayfa/data/entity/users.dart';

class SessionState {
  final Users? user;
  final bool restoring;
  const SessionState({this.user, this.restoring=false});


  SessionState copyWith({Users? user, bool? restoring}) {
    return SessionState(
      user: user ?? this.user,
      restoring: restoring ?? this.restoring,
    );
  }
}
class SessionCubit extends Cubit<SessionState>{
  SessionCubit() : super(const SessionState(restoring: true));

  Future<void> restore() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final username = prefs.getString('username');
    final password = prefs.getString('password');
    final userId = prefs.getInt('user_id');

    if (email != null && username != null && password != null && userId != null) {
      emit(SessionState(
        user: Users(user_id: userId, username: username, email: email, password: password),
        restoring: false,
      ));
    } else {
      emit(const SessionState(restoring: false));
    }
  }

  Future<void> setUser(Users user) async {
    emit(SessionState(user: user, restoring: false));
    final pref= await SharedPreferences.getInstance();
    await pref.setString('email', user.email);
    await pref.setString('username', user.username);
    await pref.setString('password', user.password);
    await pref.setInt('user_id', user.user_id);

  }
  Future<void> clearUser() async {
    emit(const SessionState(user: null ,restoring: false));
    final pref= await SharedPreferences.getInstance();
    await pref.remove('email');
    await pref.remove('username');
    await pref.remove('password');
    await pref.remove('user_id');

  }


}