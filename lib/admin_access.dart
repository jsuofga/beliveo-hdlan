import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/provider_model.dart';
import 'package:provider/provider.dart';

class AdminAccess extends StatefulWidget {
  const AdminAccess({Key? key}) : super(key: key);

  @override
  _AdminAccessState createState() => _AdminAccessState();
}

class _AdminAccessState extends State<AdminAccess> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,

        child: Column(

          children: [
            Text('ADMIN Password'),
            TextFormField(
                initialValue: '',
                   decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    // icon:Icon(Icons.person),
                    hintText: 'Enter Admin Password',
                    labelText: ''
                ),
                onChanged: (val){

                },
                validator: (val) {
                  //Regular Expression check of IP address
                  if(val != 'octava'){
                    return 'Enter valid Admin Password';
                  }else{
                    setState(() {

                    });
                    return null;
                  }
                }
            ),
            ElevatedButton.icon(
                icon: Icon(Icons.check),
                label: Text('Submit'),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    Provider.of<UserInterfaceModel>(context,listen: false).showIP();
                    //Navigator.pop(context); // Closes the Bottom Modal
                  }else{
                    Provider.of<UserInterfaceModel>(context,listen: false).hideIP();
                  }
                }
            ),

          ],
        )
    );
  }
}
