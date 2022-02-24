import 'package:flutter/material.dart';
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
import 'package:flutter_launcher_icons/main.dart';

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

  // Bottom Sheet Modal
  void showSettingsPanel() {
     showModalBottomSheet(context: context, builder: (context){
      return Container(

        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),

        child: Provider.of<UserInterfaceModel>(context).showIPform ? SettingsForm():AdminAccess()

      );

    }).whenComplete(() => Provider.of<UserInterfaceModel>(context,listen: false).hideIP() );
  }

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

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // For more than 3 bottom nav items
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        backgroundColor: Colors.black12,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.lightGreenAccent,

        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.looks_one_rounded,
            ),
            title: new Text('Floor1'),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.looks_two_rounded),
              title: new Text('Floor2')
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.looks_3_rounded),
              title: Text('Floor3')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_4_rounded),
              title: Text('Floor4')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_5_rounded),
              title: Text('Floor5')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_6_rounded),
              title: Text('Floor6')
          )

        ],

      ),

        );

  }
}






