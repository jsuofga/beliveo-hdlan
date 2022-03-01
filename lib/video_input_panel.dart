import 'package:flutter/material.dart';
import 'package:hdlan_beliveo/models/videoInputModel.dart';
import 'package:hdlan_beliveo/provider_model.dart';
import 'package:provider/provider.dart';

class VideoInputPanel extends StatefulWidget {
  const VideoInputPanel({Key? key}) : super(key: key);

  @override
  _VideoInputPanelState createState() => _VideoInputPanelState();
}

class _VideoInputPanelState extends State<VideoInputPanel> {
  @override
  Widget build(BuildContext context) {
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
  }
}

