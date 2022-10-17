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
}
