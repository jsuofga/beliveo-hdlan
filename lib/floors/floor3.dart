import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/models/cisco_small_business_switch.dart';
import 'package:hdlan_beliveo/models/tvModel.dart';

class Floor3 extends StatefulWidget {
  const Floor3({Key? key}) : super(key: key);

  @override
  _Floor3State createState() => _Floor3State();
}

class _Floor3State extends State<Floor3> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Floor 3',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0
              ),

            ),
            Wrap(
              children: [
                TVButton(tvLabel:'Screen1',mdf_idf: '1',port:'17'),
                TVButton(tvLabel:'Screen2',mdf_idf: '1',port:'18'),
                TVButton(tvLabel:'Screen3',mdf_idf: '1',port:'19'),
                TVButton(tvLabel:'Screen4',mdf_idf: '1',port:'20'),
                TVButton(tvLabel:'Screen5',mdf_idf: '1',port:'21'),
                TVButton(tvLabel:'Screen6',mdf_idf: '1',port:'22'),
                TVButton(tvLabel:'Floor 3 Screens', mdf_idf: '1',  port:'17-22'),
              ],
            )
          ]

      ),

    );
  }
}

