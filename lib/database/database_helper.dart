import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favourites.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favourites (
            id TEXT PRIMARY KEY,
            value TEXT,
            isFavourite INTEGER
          )
        ''');
      },
    );
  }
  Future<void> insertFavourite(Map<String, dynamic> data) async {
    final dbClient = await db;
    await dbClient.insert(
      'favourites',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<int> deleteFavourites(String id) async {
    final dbClient = await db;
    return await dbClient.delete('favourites',
      where: 'id = ?',
      whereArgs: [id],);
  }

  Future<List<Map<String, dynamic>>> getFavourites() async {
    final dbClient = await db;
    return await dbClient.query('favourites');
  }
}
