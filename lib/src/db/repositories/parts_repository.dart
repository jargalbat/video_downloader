import 'dart:async';
import '../db_context.dart';
import '../entities/parts.dart';

class PartsRepository {
  Future<int> insert(Part entity) async {
    var db = await DbContext().db;
    return await db.insert(tableParts, entity.toJson());
  }

  Future<int> insertList(List<Part> list) async {
    var db = await DbContext().db;
    return await db.rawInsert(tableParts, list.map((e) => e.toJson()).toList());
  }

  Future<List<Part>> getByVideoId(String videoId) async {
    var db = await DbContext().db;
    var list = await db.query(
      tableParts,
      orderBy: 'fileName ASC',
    );

    return list.map((el) => Part.fromJson(el)).toList();
  }

  Future<List<Part>> getAll() async {
    var db = await DbContext().db;
    var list = await db.query(tableParts);
    return list.map((e) => Part.fromJson(e)).toList();
  }

  Future deleteAll() async {
    var db = await DbContext().db;
    await db.rawQuery('DELETE FROM $tableParts');
  }
}
