// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:masroh_flutter_application/DrawerScreen.dart';
import 'package:masroh_flutter_application/DesaHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desa Terkenal',
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Desa Terkenal'),
        ),
        body: Stack(
          children: [
            DrawerScreen(),
            DesaHome(),
          ],
        ),
      ),
    );
  }
}
