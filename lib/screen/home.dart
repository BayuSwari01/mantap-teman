import 'package:aplikasi_daftar_teman/screen/listTeman.dart';
import 'package:aplikasi_daftar_teman/screen/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return menu();
                  }));
                },
                child:
                    Image(image: AssetImage("images/logo_aplikasi_teman.png")))
          ],
        ),
      ),
    );
  }
}
