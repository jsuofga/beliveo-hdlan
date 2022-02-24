import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/models/cisco_small_business_switch.dart';
import 'package:hdlan_beliveo/provider_model.dart';
import 'package:provider/provider.dart';


class VideoInput extends StatefulWidget {

  //constructor
  String videoInputLabel  ;
  String inputVlan  ;

  VideoInput({
    required String this.videoInputLabel,
    required String this.inputVlan,
  });

  @override
  State<VideoInput> createState() => _VideoInputState();
}

class _VideoInputState extends State<VideoInput> {
  bool hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(
        icon: Icon(Icons.input,
            color: hasBeenPressed ? Colors.orange:Colors.lightGreenAccent,
        ),
        label: Text(
          widget.videoInputLabel,
          style: TextStyle(
            color: hasBeenPressed ? Colors.orange:Colors.lightGreenAccent
          ),
        ),
        style: ButtonStyle(

          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                //side: BorderSide(color:Colors.lightGreenAccent),
                side: BorderSide(color: hasBeenPressed ? Colors.orange:Colors.lightGreenAccent),

            ),
          ),

        ),

        onPressed: () async{
          setState(() {
            hasBeenPressed = !hasBeenPressed;
          });
          Future.delayed(const Duration(seconds: 3), () {
            setState(() {
              hasBeenPressed = !hasBeenPressed;
            });

          });

          await Provider.of<SwitchingModel>(context,listen: false).selectInput(widget.inputVlan);
            String switchUnit = Provider.of<SwitchingModel>(context,listen: false).switchUnit;
            String username =  await Provider.of<SwitchingModel>(context,listen: false).getUsername();
            String password =  await Provider.of<SwitchingModel>(context,listen: false).getPassword();

            if(switchUnit =='1'){
              String ip =  await Provider.of<SwitchingModel>(context,listen: false).getIPAddressMDFSwitch();
              CiscoSmbSwitch(ipAddress: ip,username:username, password:password).connect({
                'interfaceType':'interface',
                'gi': Provider.of<SwitchingModel>(context,listen: false).port,
                'switchportType':'switchport access',
                'vlan':Provider.of<SwitchingModel>(context,listen: false).vlan
              });

            }else{
              String ip =  await Provider.of<SwitchingModel>(context,listen: false).getIPAddressIDFSwitch();
              CiscoSmbSwitch(ipAddress: ip,username:username, password:password).connect({
                'interfaceType':'interface',
                'gi': Provider.of<SwitchingModel>(context,listen: false).port,
                'switchportType':'switchport access',
                'vlan':Provider.of<SwitchingModel>(context,listen: false).vlan
              });
            }

        },
      )
    );
  }
}

