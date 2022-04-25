// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:masroh_flutter_application/DesaDataModel.dart';

class Detail extends StatelessWidget {
  final DesaDataModel desaDataModel;
  const Detail({Key? key, required this.desaDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(desaDataModel.judul),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                width: 300,
                image: AssetImage(desaDataModel.gambar),
              ),
              Text(
                desaDataModel.judul,
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
