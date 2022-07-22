import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_nasa/common/constant.dart';
import 'package:flutter_nasa/data/bean/apod_image.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._();

  static DatabaseManager? _instance;

  static DatabaseManager? getInstance() {
    // if(_instance == null){
    //   _instance = DatabaseManager._();
    // }
    _instance ??= DatabaseManager._();
    return _instance;
  }

  late Future<Database> database;

  void init() async {
    developer.log('init()', name: 'DatabaseManager');
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(join(await getDatabasesPath(), Constant.DB_NASA),
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE ${Constant.DB_TABLE_APOD}(id INTEGER PRIMARY KEY,'
        ' date TEXT, title TEXT,'
        'explanation TEXT, url TEXT,'
        'mediaType TEXT, serviceVersion TEXT,'
        'thumbs TEXT, hdUrl TEXT,'
        'copyright TEXT, '
        ')',
      );
    }, version: 1);
  }

  Future<void> insertApod(ApodImage apodImage) async {
    final db = await database;

    await db.insert(Constant.DB_TABLE_APOD, apodImage.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ApodImage>> apodList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query(Constant.DB_TABLE_APOD);
    return List.generate(
        maps.length,
        (index) => ApodImage(
            date: maps[index]['date'],
            title: maps[index]['title'],
            explanation: maps[index]['explanation'],
            url: maps[index]['title'],
            mediaType: maps[index]['title'],
            serviceVersion: maps[index]['title'],
            thumbs: maps[index]['title'],
            hdUrl: maps[index]['title'],
            copyright: maps[index]['title']));
  }
}
