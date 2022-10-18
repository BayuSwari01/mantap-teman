import 'package:aplikasi_daftar_teman/models/databaseInstance.dart';
import 'package:aplikasi_daftar_teman/screen/addTeman.dart';
import 'package:aplikasi_daftar_teman/screen/editTeman.dart';
import 'package:aplikasi_daftar_teman/screen/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';

import '../models/teman.dart';

class listTeman extends StatefulWidget {
  const listTeman({super.key});

  @override
  State<listTeman> createState() => _listTemanState();
}

class _listTemanState extends State<listTeman> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  List<Teman> listTeman = [];
  bool isSelected = false;

  initDatabase() async {
    await databaseInstance.database();
    _getTeman();
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
          title: Center(child: Text("Daftar Teman")),
        ),
        body: ListView(children: <Widget>[
          DataTable(
            showCheckboxColumn: false,
            columnSpacing: 0.0,
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
            ],
            rows: List<DataRow>.generate(
                listTeman.length,
                (int index) => DataRow(
                        selected: isSelected,
                        onSelectChanged: (value) {
                          showAdaptiveActionSheet(
                            context: context,
                            androidBorderRadius: 30,
                            actions: <BottomSheetAction>[
                              BottomSheetAction(
                                  title: Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                  onPressed: (context) async {
                                    Navigator.pop(context);
                                    await Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return editTeman(
                                        id: listTeman[index].id,
                                        nama: listTeman[index].nama,
                                        teman: listTeman[index].teman,
                                        status: listTeman[index].status,
                                      );
                                    }));
                                    setState(() {
                                      _getTeman();
                                    });
                                  }),
                              BottomSheetAction(
                                  title: Icon(
                                    Icons.delete,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  onPressed: (context) {
                                    _deleteTeman(listTeman[index], index);
                                    Navigator.pop(context);
                                  }),
                            ],
                            cancelAction: CancelAction(
                                title: Text(
                                    'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
                          );
                        },
                        cells: [
                          DataCell(Text(listTeman[index].nama ?? "kosong",
                              style: TextStyle(fontSize: 13))),
                          DataCell(Text(listTeman[index].teman ?? "Kosong",
                              style: TextStyle(fontSize: 13))),
                          DataCell(Text(listTeman[index].status ?? "Kosong",
                              style: TextStyle(fontSize: 13))),
                        ])),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return addTeman();
                  }));
                  setState(() {
                    _getTeman();
                  });
                },
                child: Icon(
                  Icons.add,
                  size: 20,
                )),
          ),
        ]));
  }

  Future<void> _getTeman() async {
    var list = await databaseInstance.getAllTeman();
    setState(() {
      listTeman.clear();

      list!.forEach((teman) {
        listTeman.add(Teman.fromMap(teman));
      });
    });
  }

  Future<void> _deleteTeman(Teman teman, int index) async {
    if (teman.id != null) {
      await databaseInstance.deleteTeman(teman.id ?? 0);
    }
    setState(() {
      _getTeman();
    });
  }
}
