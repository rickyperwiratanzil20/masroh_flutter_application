// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:masroh_flutter_application/DesaDataModel.dart';
import 'package:masroh_flutter_application/Detail.dart';

class DesaHome extends StatefulWidget {
  @override
  _DesaHomeState createState() => _DesaHomeState();
}

class _DesaHomeState extends State<DesaHome> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  static List<String> judul = [
    "Desa Wonorejo, Yogyakarta",
    "Desa Air Molek, Riau",
    "Desa Pemuteran, Bali",
    "Desa Madobak, Mentawai",
    "Desa Pujon Kidul, Malang",
  ];

  static List gambar = [
    'assets/wonorejo.jpg',
    'assets/air_molek.jpeg',
    'assets/pemuteran.jpg',
    'assets/madobak.jpg',
    'assets/pujon_kidul.jpg',
  ];

  final List<DesaDataModel> DesaData = List.generate(judul.length,
      (index) => DesaDataModel('${judul[index]}', '${gambar[index]}'));

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.85 : 1.00)
          ..rotateZ(isDrawerOpen ? -50 : 0),
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: Column(
          children: [
            isDrawerOpen
                ? GestureDetector(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        isDrawerOpen = false;
                      });
                    },
                  )
                : GestureDetector(
                    child: Icon(Icons.menu),
                    onTap: () {
                      setState(() {
                        xOffset = 290;
                        yOffset = 80;
                        isDrawerOpen = true;
                      });
                    },
                  ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(DesaData[index].judul,
                          style: TextStyle(fontSize: 20)),
                      subtitle: Text('Tekan Untuk Mengetahui Lebih Detail'),
                      leading: Image(
                        image: AssetImage(DesaData[index].gambar),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Detail(desaDataModel: DesaData[index])));
                      },
                    ),
                  );
                },
                itemCount: judul.length,
              ),
            ),
          ],
        ));
  }
}
