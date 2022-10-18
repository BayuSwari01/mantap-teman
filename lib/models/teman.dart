import 'package:flutter/foundation.dart';

class Teman {
  int? id;
  String? nama;
  String? teman;
  String? status;

  Teman({this.id, this.nama, this.teman, this.status});

  factory Teman.fromJson(Map<String, dynamic> json) {
    return Teman(
      id: json['id'],
      nama: json['nama'],
      teman: json['teman'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['nama'] = nama;
    map['teman'] = teman;
    map['status'] = status;
    return map;
  }

  Teman.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nama = map['nama'];
    this.teman = map['teman'];
    this.status = map['status'];
  }
}
