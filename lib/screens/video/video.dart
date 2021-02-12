import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideoApp extends StatefulWidget {
  final String ur;
  VideoApp(this.ur);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {

  YoutubePlayerController controller;
  @override
  void initState() {
      controller = YoutubePlayerController(
      initialVideoId: widget.ur,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:YoutubePlayer(
    controller: controller,
    showVideoProgressIndicator: true,
),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}