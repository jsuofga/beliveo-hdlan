import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/models/cisco_small_business_switch.dart';
import 'package:hdlan_beliveo/models/tvModel.dart';

class Floor1 extends StatefulWidget {
  const Floor1({Key? key}) : super(key: key);

  @override
  _Floor1State createState() => _Floor1State();
}

class _Floor1State extends State<Floor1> {



  @override
  Widget build(BuildContext context) {


    return  Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: [
                TVButton(tvLabel:'Screen1',mdf_idf: '1',port:'9'),
                TVButton(tvLabel:'Screen2',mdf_idf: '1',port:'10'),
                TVButton(tvLabel:'Screen3',mdf_idf: '1',port:'11'),
              ],
            )
          ]
      ),

    );
  }
}

