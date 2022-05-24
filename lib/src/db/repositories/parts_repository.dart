import 'dart:async';
import '../db_context.dart';
import '../entities/parts.dart';

class PartsRepository {
  Future<List<Part>> getByVideoId(String videoId) async {
    var db = await DbContext().db;
    var list = await db.query(
      tableParts,
      orderBy: 'fileName ASC',
    );

    return list.map((el) => Part.fromJson(el)).toList();
  }
}
