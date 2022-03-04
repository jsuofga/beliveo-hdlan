import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/video_input_panel.dart';
import 'package:provider/provider.dart';
import 'package:hdlan_beliveo/admin_access.dart';
import 'package:hdlan_beliveo/settings_form.dart';
import 'package:hdlan_beliveo/provider_model.dart';
import 'package:hdlan_beliveo/floors/floor1.dart';
import 'package:hdlan_beliveo/floors/floor2.dart';
import 'package:hdlan_beliveo/floors/floor3.dart';
import 'package:hdlan_beliveo/floors/floor4.dart';
import 'package:hdlan_beliveo/floors/floor5.dart';
import 'package:hdlan_beliveo/floors/floor6.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (context) => SwitchingModel()),
        ChangeNotifierProvider( create: (context) => UserInterfaceModel()),
     ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
      home: Home()

),
    ));

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Bottom Sheet Modal - Admin and Settings
  void showSettingsPanel() {
     showModalBottomSheet(isScrollControlled: true,context: context, builder: (context){
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
        child: Provider.of<UserInterfaceModel>(context).showIPform ? SettingsForm():AdminAccess()
      );

    }).whenComplete(() => Provider.of<UserInterfaceModel>(context,listen: false).hideIP() );
  }
  // Bottom sheet  Modal-Video Inputs
  void showVideoInputsPanel(){
    showModalBottomSheet(context: context, builder: (context){
      return VideoInputPanel();

    });
  }
///////////////////////////////////////////////////////////////////////////////////////////////


  //Defined variables
  int _currentIndex = 0;
  final List _screenList = [Floor1(),Floor2(),Floor3(),Floor4(),Floor5(),Floor6()];

  @override
  void initState() {
    super.initState();
  }

  // Handles bottom navigation . index used to select which widget/screen is displayed
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

    });
  }

  @override
  Widget build(BuildContext context){

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/logo-beliveo.png",height:50.0),
          centerTitle: true,
          backgroundColor: Colors.lightGreenAccent,
          actions: [
            TextButton.icon(
                onPressed: () {
                  showSettingsPanel();
                },
                label: Text(''),
                icon: Icon(Icons.settings),
                 style: TextButton.styleFrom(
                   primary: Colors.white,
                 )
            )
          ],

        ),
       backgroundColor: Colors.grey[800],
        body: _screenList[_currentIndex],

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<SwitchingModel>(context,listen: false).selectSwitchUnit('all');
          showVideoInputsPanel();

        },
        label: const Text('All Screens '),
        icon: const Icon(Icons.apartment),
        backgroundColor: Colors.indigo,
      ),


      bottomNavigationBar: Stack(
        children: [
          CurvedNavigationBar(
          onTap: onTabTapped, // new
          backgroundColor: Colors.black12,
          animationDuration: Duration(milliseconds: 300),
          // animationCurve: Curves.bounceInOut,
          color: Colors.lightGreenAccent,
          items: [
            Icon(Icons.looks_one_rounded,color: Colors.indigoAccent,),
            Icon(Icons.looks_two_rounded,color: Colors.indigoAccent),
            Icon(Icons.looks_3_rounded,color: Colors.indigoAccent),
            Icon(Icons.looks_4_rounded,color: Colors.indigoAccent),
            Icon(Icons.looks_5_rounded,color: Colors.indigoAccent),
            Icon(Icons.looks_6_rounded,color: Colors.indigoAccent),
          ],
        ),
          Positioned(
              bottom: 10,
              left:screenSize.width/2 - 16,
              child: Text('Floor',
                style: TextStyle(color: Colors.indigoAccent,fontSize: 16,),

              )
          )
        ]
      ),


    );

  }
}






