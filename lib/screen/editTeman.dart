import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class editTeman extends StatefulWidget {
  const editTeman({super.key});

  @override
  State<editTeman> createState() => _editTemanState();
}

class _editTemanState extends State<editTeman> {
  TextEditingController nama = TextEditingController();
  TextEditingController teman = TextEditingController();
  TextEditingController status = TextEditingController();
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
                        onPressed: null,
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
}
