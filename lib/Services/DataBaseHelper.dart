import 'dart:io';
import 'package:flutter/services.dart';

import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static DataBaseHelper instance = DataBaseHelper();
  Database? database;
  String dataBasePath = "";

  Future<Database> getdataBase() async {
    String baseDbPath = await getDatabasesPath();
    dataBasePath = path.join(baseDbPath, "tracker.db");
    bool isDatabasePresent = await databaseExists(dataBasePath);
    if (!isDatabasePresent) {
      await initDb("tracker.db");
    }
    Database database = await openDatabase(dataBasePath);

    return database;
  }

  Future initDb(String fileName) async {
    String baseDbPath = await getDatabasesPath();
    dataBasePath = path.join(baseDbPath, fileName);
    bool isDatabasePresent = await databaseExists(dataBasePath);

    if (isDatabasePresent) {
      print("dataBase present already");
      database = await openDatabase(dataBasePath);
    } else {
      try {
        await Directory(path.dirname(dataBasePath)).create(recursive: true);
      } catch (e) {
        print(e);
      }
      ByteData data = await rootBundle.load(path.join("assets", fileName));
      List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(dataBasePath).writeAsBytes(bytes, flush: true);
      print("db copied at $dataBasePath");
    }
    database = await openDatabase(dataBasePath);
  }

  closeDataBase() async {
    await database?.close();
  }
}
