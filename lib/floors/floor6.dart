import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/models/tvModel.dart';

class Floor6 extends StatefulWidget {
  const Floor6({Key? key}) : super(key: key);

  @override
  _Floor6State createState() => _Floor6State();
}

class _Floor6State extends State<Floor6> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Floor 6',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0
              ),

            ),
            Wrap(
              children: [
                TVButton(tvLabel:'Screen1',mdf_idf: '2',port:'13'),
                TVButton(tvLabel:'Screen2',mdf_idf: '2',port:'14'),
                TVButton(tvLabel:'Screen3',mdf_idf: '2',port:'15'),
                TVButton(tvLabel:'Screen4',mdf_idf: '2',port:'16'),
                TVButton(tvLabel:'Floor 6 Screens', mdf_idf: '2',  port:'13-16'),
              ],
            )
          ]

      ),

    );
  }
}