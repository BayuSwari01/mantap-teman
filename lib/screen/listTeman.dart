import 'package:aplikasi_daftar_teman/screen/addTeman.dart';
import 'package:aplikasi_daftar_teman/screen/editTeman.dart';
import 'package:aplikasi_daftar_teman/screen/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';

class listTeman extends StatefulWidget {
  const listTeman({super.key});

  @override
  State<listTeman> createState() => _listTemanState();
}

class _listTemanState extends State<listTeman> {
  List<String> nama = ["bayu", "fuza", "baki", "abc"];
  List<String> teman = ["-", "SMP", "Rumah", "aaa"];
  List<String> status = ["Diri sendiri", "Pacar", "Sahabat", "wow"];
  int length = 4;
  bool isSelected = false;

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
                length,
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
                                  ),
                                  onPressed: (context) {
                                    Navigator.pop(context);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return editTeman(
                                        nama: nama[index],
                                        teman: teman[index],
                                        status: status[index],
                                      );
                                    }));
                                  }),
                              BottomSheetAction(
                                  title: Icon(
                                    Icons.delete,
                                    size: 20,
                                  ),
                                  onPressed: (context) {
                                    Navigator.pop(context);
                                  }),
                            ],
                            cancelAction: CancelAction(
                                title: Text(
                                    'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
                          );
                        },
                        cells: [
                          DataCell(Text(nama[index],
                              style: TextStyle(fontSize: 13))),
                          DataCell(Text(teman[index],
                              style: TextStyle(fontSize: 13))),
                          DataCell(Text(status[index],
                              style: TextStyle(fontSize: 13))),
                        ])),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return addTeman();
                  }));
                },
                child: Icon(
                  Icons.add,
                  size: 20,
                )),
          ),
        ]));
  }
}
