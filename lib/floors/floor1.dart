import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/models/cisco_small_business_switch.dart';
import 'package:hdlan_beliveo/models/tvModel.dart';

class Floor1 extends StatefulWidget {
  const Floor1({Key? key}) : super(key: key);

  @override
  _Floor1State createState() => _Floor1State();
}

class _Floor1State extends State<Floor1> {

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return  Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: screenSize.height/3,
              child: Center(
                child: Text('Floor 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0
                  ),

                ),
              ),
            ),
            Wrap(
              children: [
                TVButton(tvLabel:'Screen1',mdf_idf: '1',port:'9'),
                TVButton(tvLabel:'Screen2',mdf_idf: '1',port:'10'),
                TVButton(tvLabel:'Floor 1 Screens', mdf_idf: '1',  port:'9-10'),
              ],
            ),

          ]
      ),

    );
  }
}
//
// Text('Floor 1',
// style: TextStyle(
// color: Colors.white,
// fontSize: 40.0
// ),
//
// ),

