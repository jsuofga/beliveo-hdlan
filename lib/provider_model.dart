import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


// Create a ChangeNotifier Provider model:
class SwitchingModel extends ChangeNotifier {

  String switchUnit = '';
  String port = '';
  String vlan = '';
  String MDF_IP = '';
  String IDF_IP = '';
  String username = '';
  String password = '';

  //Methods

  //Read from storage
  getIPAddressMDFSwitch() async {
    final prefs = await SharedPreferences.getInstance();
    //Read from storage
    MDF_IP = prefs.getString('ip_mdf') ?? '';
    print('mdf is $MDF_IP');
    notifyListeners();
    return MDF_IP;
  }
  getIPAddressIDFSwitch() async {
    final prefs = await SharedPreferences.getInstance();
    //Read from storage
    IDF_IP = prefs.getString('ip_idf') ?? '';
    print('idf is $IDF_IP');
    notifyListeners();
    return IDF_IP;
  }
  getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    //Read from storage
    username = prefs.getString('username') ?? '';
    print('username is $username');
    notifyListeners();
    return username;
  }
  getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    //Read from storage
    password = prefs.getString('password') ?? '';
    print('password is $password');
    notifyListeners();
    return password;
  }
  selectSwitchUnit(_unit){
    switchUnit = _unit;
     print('switch unit:${switchUnit}');
    notifyListeners();
  }
  selectPort(_port){
    port = _port;
     print('port:${port}');
    notifyListeners();
  }

  selectInput(_inputVlan){
    vlan = _inputVlan;
     print('vlan:${vlan}');
    notifyListeners();
  }

}

class UserInterfaceModel extends ChangeNotifier {
  bool showIPform = false;
  //Methods
  showIP() {
    showIPform = true;
    notifyListeners();
  }
  hideIP() {
    showIPform = false;
    notifyListeners();
  }

}
