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

  Future<Users?> girisyap(String email, String password) async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();
    final maps = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (maps.isNotEmpty) {
      return Users.fromMap(maps.first);
    }
    return null;
  }

  Future<String?> kullaniciadiCek(String email) async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();
    final maps = await db.query(
      "users",
      columns: ["username"],
      where: "email = ?",
      whereArgs: [email],
    );
    if (maps.isNotEmpty) {
      return maps.first["username"] as String;
    }
    return null;
  }
  Future<void> taskEkle(Tasks task) async {
    try {
      var db = await VeritabaniYardimcisi.veritabaniErisim();
      var yeniTask = {
        "user_id": task.userId,
        "title": task.title,
        "description": task.description,
        "is_completed": task.isCompleted ? 1 : 0,
        "due_date": task.dueDate.toIso8601String(),
        "created_at": task.createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      };
      await db.insert("tasks", yeniTask);
      print("Task başarıyla eklendi.");
    } catch (e) {
      print("Task eklenirken hata oluştu: $e");
    }
  }

  Future<List<Tasks>> taskleriGetir(int userId) async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();
    final maps = await db.query(
      'tasks',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'created_at DESC',
    );
    return maps.map((m) => Tasks.fromMap(m)).toList();
  }

}