import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:video_downloader/src/db/entities/downloads.dart';
import 'entities/parts.dart';

class DbContext {
  // Singleton
  static final DbContext _singleton = DbContext._internal();

  factory DbContext() {
    return _singleton;
  }

  DbContext._internal();

  // Database
  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }

    _db = await _initDb();
    return _db!;
  }

  // Init (or create) database
  _initDb() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'videodownloader.db');
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  // Dispose DB
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  // Create table
  void _onCreate(Database db, int newVersion) async {
    // Column types
    // const idType = 'TEXT PRIMARY KEY';
    // const textType = 'TEXT';
    // const boolType = 'BOOLEAN';
    // const integerType = 'INTEGER';
    // const realType = 'REAL';
    // const notNull = 'NOT NULL';
    // const def = 'DEFAULT';
    // const autoInc = 'AUTOINCREMENT';

    try {
      await db.execute('''
        CREATE TABLE $tableParts(
          id TEXT PRIMARY KEY,
          partId TEXT NOT NULL,
          videoId TEXT NOT NULL,
          url TEXT NOT NULL,
          fileName TEXT NOT NULL,
          isCompleted BOOLEAN DEFAULT 0,
          time TEXT NOT NULL
          )
      ''');

      await db.execute('''
        CREATE TABLE $tableDownloads(
          videoId TEXT PRIMARY KEY,
          url TEXT NOT NULL,
          path TEXT NOT NULL,
          status TEXT NOT NULL,
          percent INTEGER DEFAULT 0,
          time TEXT NOT NULL
          )
      ''');

      debugPrint('Tables created successfully');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
