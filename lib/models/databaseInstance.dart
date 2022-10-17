import 'dart:convert';
import 'dart:io';
import 'package:aplikasi_daftar_teman/models/teman.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInstance {
  final String _databaseName = "teman_database.db";
  final int _databaseVersion = 1;

  // tabel teman
  final String tabel = "teman";
  final String id = "id";
  final String nama = "nama";
  final String teman = "teman";
  final String status = "status";

  Database? _database;
  Future<Database> database() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tabel ($id INTEGER PRIMARY KEY, $nama TEXT, $teman TEXT, $status TEXT)');
  }

  Future<List<Teman>> getTeman() async {
    final data = await _database!.query(tabel);
    List<Teman> result = data.map((e) => Teman.fromJson(e)).toList();
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = _database!.insert(tabel, row);
    return query;
  }
}
