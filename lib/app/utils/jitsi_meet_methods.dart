import 'package:flutter/cupertino.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom/app/auth/auth_methods.dart';
import 'package:zoom/app/utils/firestore_methods.dart';

class JitsiMeetMethod {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  void createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String username = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      if (username.isEmpty) {
        username = _authMethods.user.displayName!;
      }
      var options = JitsiMeetingOptions(room: roomName)
        // ..serverURL = "https://someHost.com"
        // ..subject = "Meeting with Gunschu"
        ..userDisplayName = username
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL
        // ..audioOnly = true
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      // ..featureFlag = featureFlag;

      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}
