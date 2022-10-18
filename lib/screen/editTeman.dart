import 'package:aplikasi_daftar_teman/models/databaseInstance.dart';
import 'package:aplikasi_daftar_teman/models/teman.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite/sqlite_api.dart';

class editTeman extends StatefulWidget {
  const editTeman({super.key, this.id, this.nama, this.teman, this.status});
  final int? id;
  final String? nama;
  final String? teman;
  final String? status;

  @override
  State<editTeman> createState() => _editTemanState();
}

class _editTemanState extends State<editTeman> {
  TextEditingController nama = TextEditingController();
  TextEditingController teman = TextEditingController();
  TextEditingController status = TextEditingController();
  DatabaseInstance db = DatabaseInstance();

  initDatabase() async {
    await db.database();
  }

  @override
  void initState() {
    // TODO: implement initState
    nama.text = widget.nama!;
    teman.text = widget.teman!;
    status.text = widget.status!;
    initDatabase();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Edit Teman")),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Nama",
              ),
              controller: nama,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Teman",
              ),
              controller: teman,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Status",
              ),
              controller: status,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () async {
                          await editTeman();
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.add,
                          size: 20,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> editTeman() async {
    await db.updateTeman(Teman(
        id: widget.id,
        nama: nama.text,
        teman: teman.text,
        status: status.text));
  }
}
