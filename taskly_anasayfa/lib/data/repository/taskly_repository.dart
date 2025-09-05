import 'package:taskly_anasayfa/sqlite/veritabani_yardimcisi.dart';
import 'package:taskly_anasayfa/data/entity/users.dart';
import 'package:taskly_anasayfa/data/entity/tasks.dart';


class TasklyRepository {
  Future<void> kaydet(String username, String email, String password) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniKisi = Map<String, dynamic>();
    yeniKisi["username"] = username;
    yeniKisi["email"] = email;
    yeniKisi["password"] = password;
    await db.insert("users", yeniKisi);
    print("----------------------------------------------------Veri eklendi----------------------------------------------------");
  }

  Future<void> girisyap(String email, String password) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.query("users",
        columns: ["user_id", "username", "email", "password"],
        where: "email = ? AND password = ?",
        whereArgs: [email, password]);
    if (maps.isNotEmpty) {
      var kullanici = Users(
          user_id: maps.first["user_id"],
          username: maps.first["username"],
          email: maps.first["email"],
          password: maps.first["password"]);
      print("----------------------------------------------------Giriş başarılı: ${kullanici.username}----------------------------------------------------");
    } else {
      print("----------------------------------------------------Giriş başarısız----------------------------------------------------");
    }
  }


}