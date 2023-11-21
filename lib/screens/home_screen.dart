import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom/resources/jitsi_meet_methods.dart';
import 'package:zoom/screens/video_call_screen.dart';
import 'package:zoom/widgets/home_screen_buttom.dart';

class HomeScreen extends StatefulWidget {
  static const route = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final JitsiMeetModels models = JitsiMeetModels();

  onJoinMeeting() async {
    print("entered");
    Random random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    models.joinExistingMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  onCreateMeeting() async {
    Navigator.pushNamed(context, VideoCallScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meeting",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeScreenCustomButton(
                  onTap: onJoinMeeting,
                  icon: CupertinoIcons.video_camera_solid,
                  text: "Join"),
              HomeScreenCustomButton(
                  onTap: onCreateMeeting,
                  icon: Icons.add_box_rounded,
                  text: 'Create'),
              HomeScreenCustomButton(
                  onTap: () {},
                  icon: CupertinoIcons.calendar_today,
                  text: 'Schedule'),
              HomeScreenCustomButton(
                onTap: () {},
                icon: Icons.add_to_home_screen,
                text: 'Share',
              ),
            ],
          ),
          const Expanded(
              child: Center(
            child: Text("Create, Join Meetings with just on click"),
          ))
        ],
      ),
    );
  }
}
