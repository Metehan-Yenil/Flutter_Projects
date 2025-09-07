class Users{
  final int user_id;
  final String username;
  final String email;
  final String password;

  Users({required this.user_id,required this.username,required this.email,required this.password});

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      user_id: map['user_id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}