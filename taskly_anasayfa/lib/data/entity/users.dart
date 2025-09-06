class Users{
  final int? user_id;
  final String username;
  final String email;
  final String password;

  Users({ this.user_id,required this.username,required this.email,required this.password});

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(

      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}