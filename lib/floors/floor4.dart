import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/models/tvModel.dart';

class Floor4 extends StatefulWidget {
  const Floor4({Key? key}) : super(key: key);

  @override
  _Floor4State createState() => _Floor4State();
}

class _Floor4State extends State<Floor4> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: [
                TVButton(tvLabel:'Screen1',mdf_idf: '2',port:'1'),
                TVButton(tvLabel:'Screen2',mdf_idf: '2',port:'2'),
                TVButton(tvLabel:'Screen3',mdf_idf: '2',port:'3'),
                TVButton(tvLabel:'Screen1',mdf_idf: '2',port:'4'),
                TVButton(tvLabel:'Screen2',mdf_idf: '2',port:'5'),
                TVButton(tvLabel:'Screen3',mdf_idf: '2',port:'6'),

              ],
            )
          ]

      ),

    );
  }
}