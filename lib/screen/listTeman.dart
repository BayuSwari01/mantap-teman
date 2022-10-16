import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class listTeman extends StatefulWidget {
  const listTeman({super.key});

  @override
  State<listTeman> createState() => _listTemanState();
}

class _listTemanState extends State<listTeman> {
  int length = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Daftar Teman")),
        ),
        body: ListView(children: <Widget>[
          DataTable(
            columnSpacing: 35,
            columns: [
              DataColumn(
                label: Text("Nama",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text("Teman",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text(
                  "Status",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text("Aksi",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ],
            rows: List<DataRow>.generate(
                length,
                (int index) => DataRow(cells: [
                      DataCell(Text("Bayu Al ikhlas Swari",
                          style: TextStyle(fontSize: 13))),
                      DataCell(Text("$index", style: TextStyle(fontSize: 13))),
                      DataCell(Text("status", style: TextStyle(fontSize: 13))),
                      DataCell(Row(
                        children: <Widget>[
                          Container(
                              height: 30,
                              width: 50,
                              child: ElevatedButton(
                                  onPressed: null,
                                  child: Icon(
                                    Icons.edit,
                                    size: 15,
                                  ))),
                          Container(
                              height: 30,
                              width: 50,
                              margin: EdgeInsets.only(left: 5.0),
                              child: ElevatedButton(
                                  onPressed: null,
                                  child: Icon(
                                    Icons.delete,
                                    size: 15,
                                  )))
                        ],
                      )),
                    ])),
          ),
        ]));
  }
}
