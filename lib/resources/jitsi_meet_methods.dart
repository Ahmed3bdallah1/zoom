import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom/resources/auth_services.dart';
import 'package:zoom/resources/firestore_services.dart';
import 'package:zoom/utilits/snak_bar.dart';

class JitsiMeetModels {
  final AuthModels authModels = AuthModels();
  final FirestoreMethods firestoreMethods = FirestoreMethods();

  // joinJitsiMeeting({
  //   required String roomName,
  //   required bool isVideoMuted,
  //   required bool isAudioMuted,
  // }) async {
  //   try {
  //     FeatureFlag featureFlag = FeatureFlag();
  //     featureFlag.welcomePageEnabled = false;
  //     featureFlag.resolution = FeatureFlagVideoResolution
  //         .MD_RESOLUTION; // Limit video resolution to 360p
  //
  //     var options = JitsiMeetingOptions(room: roomName)
  //       ..userDisplayName = _authModels.user.displayName
  //       ..userEmail = _authModels.user.email
  //       ..userAvatarURL = _authModels.user.photoURL // or .png
  //       ..audioMuted = isAudioMuted
  //       ..videoMuted = isVideoMuted;
  //
  //     await JitsiMeet.joinMeeting(options);
  //   } catch (error) {
  //     print("error: $error");
  //   }
  // }

  void joinExistingMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted}) {
    var options = JitsiMeetingOptions(roomNameOrUrl: roomName)
      ..userDisplayName = authModels.user.displayName
      ..userDisplayName = authModels.user.email
      ..userAvatarUrl = authModels.user.photoURL // or .png
      ..isAudioMuted = isAudioMuted
      ..isVideoMuted = isVideoMuted;

    JitsiMeetWrapper.joinMeeting(options: options);
  }

  void createMeeting(
    BuildContext context, {
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      // FeatureFlag featureFlag = FeatureFlag();
      // featureFlag.welcomePageEnabled = false;
      // featureFlag.resolution = FeatureFlagVideoResolution
      //     .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (username.isEmpty) {
        name = authModels.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(roomNameOrUrl: roomName)
        ..userDisplayName = name
        ..userEmail = authModels.user.email
        ..userAvatarUrl = authModels.user.photoURL
        ..isAudioMuted = isAudioMuted
        ..isVideoMuted = isVideoMuted;

      firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeetWrapper.joinMeeting(options: options);
    } catch (error) {
      print("error: $error");
    }
  }
}
