// Telnet Testing
import 'dart:io';
import 'dart:async';

class CiscoSmbSwitch{

  String ipAddress = '';
  String username = '';
  String password = '';
  int telnetPort = 23;

  // Constructor
  CiscoSmbSwitch({this.ipAddress = '',this.username = '',this.password = ''});

  //Methods

  void connect(Map payload) async {
    Socket socket = await Socket.connect(ipAddress, telnetPort);
    print('connected');
    socket.write('$username\r');
    sleep(new Duration(milliseconds: 200));
    socket.write('$password\r');
    sleep(new Duration(milliseconds: 200));
    socket.write('config\r');
    sleep(new Duration(milliseconds: 200));
    socket.write('$payload\r');

    print(payload['interfaceType'] + ' gi${payload['gi']}' );
    socket.write(payload['interfaceType'] + ' gi${payload['gi']} \r');
    sleep(new Duration(milliseconds: 200));

    print('${payload['switchportType']}' + ' vlan${payload['vlan']}' );
    socket.write('${payload['switchportType']}' + ' vlan${payload['vlan']} \r');
    sleep(new Duration(milliseconds: 200));

    socket.close();
    print('dis-connected');
  }



}

