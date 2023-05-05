import 'package:app_broadcastt/utils.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LiveScreenView extends StatelessWidget {

  final String liveId, userId;
  final bool isHost;

  LiveScreenView({required this.liveId,required this.userId, required this.isHost});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: Utils.appId,
        appSign: Utils.appSignIn,
        userID: userId,
        userName: "user_$userId",
        liveID: liveId,
        config: isHost 
        ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
        : ZegoUIKitPrebuiltLiveStreamingConfig.audience()
        ..audioVideoViewConfig.showAvatarInAudioMode = true
        ..audioVideoViewConfig.showSoundWavesInAudioMode = true,
        ),
        );

  }
}