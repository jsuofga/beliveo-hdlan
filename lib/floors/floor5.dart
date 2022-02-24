import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/models/tvModel.dart';

class Floor5 extends StatefulWidget {
  const Floor5({Key? key}) : super(key: key);

  @override
  _Floor5State createState() => _Floor5State();
}

class _Floor5State extends State<Floor5> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: [
                TVButton(tvLabel:'Screen4',mdf_idf: '2',port:'7'),
                TVButton(tvLabel:'Screen5',mdf_idf: '2',port:'8'),
                TVButton(tvLabel:'Screen6',mdf_idf: '2',port:'9'),
                TVButton(tvLabel:'Screen4',mdf_idf: '2',port:'10'),
                TVButton(tvLabel:'Screen5',mdf_idf: '2',port:'11'),
                TVButton(tvLabel:'Screen6',mdf_idf: '2',port:'12'),
              ],
            )
          ]

      ),

    );
  }
}