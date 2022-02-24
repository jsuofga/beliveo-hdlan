import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/models/videoInputModel.dart';
import 'package:hdlan_beliveo/provider_model.dart';
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
          return Container(
             color: Colors.grey[800],
              child:Column(
                children: [
                  Text(
                    'Video Sources',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height:50.0),
                  Wrap(
                    children: [
                      VideoInput(videoInputLabel: 'Input 1',inputVlan:'2'),
                      VideoInput(videoInputLabel: 'Input 2',inputVlan:'3'),
                      VideoInput(videoInputLabel: 'Input 3',inputVlan:'4'),
                      VideoInput(videoInputLabel: 'Input 4',inputVlan:'5'),
                      VideoInput(videoInputLabel: 'Input 5',inputVlan:'6'),
                      VideoInput(videoInputLabel: 'Input 6',inputVlan:'7')
                    ],

                  ),
                  Text(Provider.of<SwitchingModel>(context).switchUnit),
                ],
              )

          );

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