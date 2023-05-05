import 'dart:math';

import 'package:app_broadcastt/livescreenview.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final liveidcontroller = TextEditingController();
  final String userId = Random().nextInt(900000 + 100000).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text("User ID: $userId"),
                const SizedBox(height: 20),
                TextFormField(
                  controller: liveidcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Join or start a live stream',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(
                    builder:(context) => LiveScreenView(
                      liveId: liveidcontroller.text,
                      userId: userId,
                      isHost: true,
                    ),
                    
                    
                    
                    ));
                  },
                  child: const Text('Start a Live Stream'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(
                    builder:(context) => LiveScreenView(
                      liveId: liveidcontroller.text,
                      userId: userId,
                      isHost: false,
                    ),
                    
                    
                    
                    ));
                  },
                  child: const Text('Join a Live Stream'),
                ),
              ],
            )));
  }
}
