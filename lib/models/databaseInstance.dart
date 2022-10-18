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
  final String filter = "kuliah";

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

  Future<List?> getAllTeman() async {
    var dbClient = await _database;
    print(dbClient);
    var result = await dbClient!.query(tabel, columns: [
      id,
      nama,
      teman,
      status,
    ]);
    return result.toList();
  }

  Future<List?> getAllTemanKuliah() async {
    var dbClient = await _database;
    print(dbClient);
    var result = await dbClient!.query(tabel, where: '$teman = ?', whereArgs: [
      filter
    ], columns: [
      id,
      nama,
      teman,
      status,
    ]);

    return result.toList();
  }

  Future<int?> tambahTeman(Teman teman) async {
    var dbClient = await _database;
    return await dbClient!.insert(tabel, teman.toMap());
  }

  Future<int?> updateTeman(Teman teman) async {
    var dbClient = await _database;
    return await dbClient!
        .update(tabel, teman.toMap(), where: '$id = ?', whereArgs: [teman.id]);
  }

  Future<int?> deleteTeman(int Id) async {
    var dbClient = await _database;
    return await dbClient!.delete(tabel, where: '$id = ?', whereArgs: [Id]);
  }
}
