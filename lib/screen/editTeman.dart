import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class editTeman extends StatefulWidget {
  const editTeman({super.key, this.nama, this.teman, this.status});

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nama.text = widget.nama!;
    teman.text = widget.teman!;
    status.text = widget.status!;
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
