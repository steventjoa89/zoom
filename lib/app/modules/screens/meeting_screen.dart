import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom/app/constants/colors.dart';
import 'package:zoom/app/utils/jitsi_meet_methods.dart';
import 'package:zoom/app/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 100000000).toString();

    _jitsiMeetMethod.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPress: createNewMeeting,
              icon: Icons.videocam,
              text: 'New Meeting',
              buttonColor: mainButtonColor,
            ),
            HomeMeetingButton(
              onPress: () => joinMeeting(context),
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
              buttonColor: buttonColor,
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create or Join a meeting',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
