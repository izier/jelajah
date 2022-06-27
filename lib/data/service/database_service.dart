import 'package:jelajah/data/model/user.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static DatabaseService? _instance;
  static Database? _database;

  DatabaseService._internal() {
    _instance = this;
  }

  factory DatabaseService() => _instance ?? DatabaseService._internal();

  final String tableName = 'user';

  Future<Database?> get database async => _database ??= await _initializeDb();

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();

    var db = openDatabase(
      '$path/database.db',
      onCreate: _onCreate,
      version: 1,
    );

    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $tableName (
        id TEXT PRIMARY KEY,
        fullname TEXT,
        username TEXT,
        password TEXT
      );
    ''');
  }

  Future<int> insert(UserModel userModel) async {
    final db = await database;
    return await db!.insert(tableName, userModel.toJson());
  }

  Future<List<UserModel>> findAll() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(tableName);

    return results.map((res) => UserModel.fromJson(res)).toList();
  }

  Future<bool> findById(int id) async {
    final db = await database;

    final result = await db!.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    return result.isNotEmpty;
  }

  Future<int> remove(UserModel userModel) async {
    final db = await database;

    return await db!.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [userModel.username],
    );
  }
}
