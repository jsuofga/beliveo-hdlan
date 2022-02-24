
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  String _ip_mdf = ''; // MDF switch ip address
  String _ip_idf = ''; // IDF switch ip address
  String _userName = '';
  String _passWord = '';

  bool needToChangeIP = false;

  @override
  void initState() {
    super.initState();
    _readIPAddress();
  }
  //Read from storage
  void _readIPAddress() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _ip_mdf = prefs.getString('ip_mdf') ?? '';
      _ip_idf = prefs.getString('ip_idf') ?? '';
      _userName = prefs.getString('username') ?? '';
      _passWord = prefs.getString('password') ?? '';

    });
  }
  //Save to storage
  void _saveIPaddress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ip_mdf', _ip_mdf);
    await prefs.setString('ip_idf', _ip_idf);
    await prefs.setString('username', _userName);
    await prefs.setString('password', _passWord);
  }

  @override
  Widget build(BuildContext context) {

    return Form(

        key: _formKey,

        child: Column(

          children: [
            Text('IP Address of MDF'),
            TextFormField(
              initialValue:_ip_mdf ,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  // icon:Icon(Icons.person),
                  hintText: 'Enter IP Address of MDF Switch',
                  labelText: _ip_mdf
              ),
              onChanged: (val){
                setState(() {
                  needToChangeIP = true;
                });
              },
              validator: (val) {
                //Regular Expression check of IP address
                if(!RegExp(r"^(?!0)(?!.*\.$)((1?\d?\d|25[0-5]|2[0-4]\d)(\.|$)){4}$").hasMatch(val!) ){
                    return 'Enter IP address of MDF Switch';
                  }else{
                    setState(() {
                      print(val);
                      _ip_mdf = val;
                    });
                    return null;
                  }
              }
            ),
            Text('IP Address of IDF'),
            TextFormField(
                initialValue:_ip_idf ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    // icon:Icon(Icons.person),
                    hintText: 'Enter IP Address of IDF Switch',
                    labelText: _ip_idf
                ),
                onChanged: (val){
                  setState(() {
                    needToChangeIP = true;
                  });
                },
                validator: (val) {
                  //Regular Expression check of IP address
                  if(!RegExp(r"^(?!0)(?!.*\.$)((1?\d?\d|25[0-5]|2[0-4]\d)(\.|$)){4}$").hasMatch(val!) ){
                    print('eye of tiger ${val}');
                    return 'Enter IP address of IDF Switch';
                  }else{
                    setState(() {
                      print(val);
                      _ip_idf = val;
                    });
                    return null;
                  }
                }
            ),
            Text('User Name'),
            TextFormField(
                initialValue: _userName ,
                obscureText:true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    // icon:Icon(Icons.person),
                    hintText: 'User Name',
                    labelText: 'not shown'
                ),
                onChanged: (val){
                  setState(() {
                    needToChangeIP = true;
                  });
                },
                validator: (val) {
                  //Check username is entered
                  if( val!.isEmpty){
                    return 'Enter User Name';
                  }else{
                    setState(() {
                      print(val);
                      _userName = val;
                    });
                    return null;
                  }
                }
            ),
            Text('Password'),
            TextFormField(
                initialValue:_passWord,
                obscureText:true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    // icon:Icon(Icons.person),
                    hintText: 'Password',
                    labelText: 'not shown'
                ),
                onChanged: (val){
                  setState(() {
                    needToChangeIP = true;
                  });
                },
                validator: (val) {
                  //Check Password is entered
                  if( val!.isEmpty){
                    return 'Enter Password';
                  }else{
                    setState(() {
                      print(val);
                      _passWord = val;
                    });
                    return null;
                  }
                }
            ),
            Visibility(
              visible: needToChangeIP,
              child: ElevatedButton.icon(
                  icon: Icon(Icons.check),
                  label: Text('Submit'),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                     print('success');
                     // Save IP address to storage
                     _saveIPaddress();
                     Navigator.pop(context); // Closes the Bottom Modal
                    }
                  }
              ),
            ),

          ],
        )
    );
  }
}
