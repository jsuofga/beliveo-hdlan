import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/models/cisco_small_business_switch.dart';
import 'package:hdlan_beliveo/models/tvModel.dart';

class Floor2 extends StatefulWidget {
  const Floor2({Key? key}) : super(key: key);

  @override
  _Floor2State createState() => _Floor2State();
}

class _Floor2State extends State<Floor2> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Floor 2',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0
                ),

              ),
            Wrap(
              children: [
                TVButton(tvLabel:'Screen1',mdf_idf: '1',port:'11'),
                TVButton(tvLabel:'Screen2',mdf_idf: '1',port:'12'),
                TVButton(tvLabel:'Screen3',mdf_idf: '1',port:'13'),
                TVButton(tvLabel:'Screen4',mdf_idf: '1',port:'14'),
                TVButton(tvLabel:'Screen5',mdf_idf: '1',port:'15'),
                TVButton(tvLabel:'Screen6',mdf_idf: '1',port:'16'),
                TVButton(tvLabel:'Floor 2 Screens', mdf_idf: '1',  port:'11-16'),
              ],
            )
          ]

        ),

    );
  }
}

