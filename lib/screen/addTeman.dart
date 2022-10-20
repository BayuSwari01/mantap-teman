import 'package:aplikasi_daftar_teman/models/databaseInstance.dart';
import 'package:aplikasi_daftar_teman/models/teman.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class addTeman extends StatefulWidget {
  const addTeman({super.key});

  @override
  State<addTeman> createState() => _addTemanState();
}

class _addTemanState extends State<addTeman> {
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
    initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tambah Teman")),
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
                          if (nama.text == "" ||
                              teman.text == "" ||
                              status.text == "") {
                            _dialogBuilder(context);
                          } else {
                            await upTeman();
                            Navigator.pop(context);
                          }
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

  Future<void> upTeman() async {
    print(nama.text);
    if (nama != null) {
      await db.tambahTeman(Teman(
        nama: nama.text,
        teman: teman.text,
        status: status.text,
      ));
    }
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Form kosong'),
          content: const Text('Harap isi semua form'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
