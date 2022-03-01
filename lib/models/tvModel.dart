import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/provider_model.dart';
import 'package:hdlan_beliveo/video_input_panel.dart';
import 'package:provider/provider.dart';

class TVButton extends StatefulWidget {
  //Constructor
  String tvLabel ;
  String mdf_idf ;  //1 for mdf, 2 for idf
  String port ;

  TVButton({
    required String this.tvLabel,
    required String this.mdf_idf,
    required String this.port,
  });

  @override
  State<TVButton> createState() => _TVButtonState();
}

class _TVButtonState extends State<TVButton> {
  @override
  Widget build(BuildContext context) {

    ///////// Bottom Modal ////////////////////////////////////////////////////////////////
    void showSettingsPanel(){
        showModalBottomSheet(context: context, builder: (context){
          return VideoInputPanel();
        });
      }
///////////////////////////////////////////////////////////////////////////////////////////////

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(
          icon: Icon(
              Icons.tv,
              color: Colors.lightGreenAccent,
          ),
          label: Text(
              widget.tvLabel,
              style: TextStyle(
                color: Colors.lightGreenAccent
              ),

          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color:Colors.lightGreenAccent)
              ),
            ),

          ),
          onPressed: () {
            Provider.of<SwitchingModel>(context,listen: false).selectSwitchUnit(widget.mdf_idf);
            Provider.of<SwitchingModel>(context,listen: false).selectPort(widget.port);
            showSettingsPanel();
          }
      ),
    );
  }
}