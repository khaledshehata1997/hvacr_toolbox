import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


class VideoApp extends StatefulWidget {
  final String url;
  VideoApp(this.url);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.url);

      _controller.initialize().then((_) {
        _controller.seekTo(Duration(seconds: 1));
        setState(() {
          
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: _controller.value.initialized? VideoPlayer(_controller)
              // ? AspectRatio(
              //     aspectRatio: _controller.value.aspectRatio,
                //   child: VideoPlayer(_controller),
                // )
              : Container(),
        ),
        Center(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
               _controller.value.duration <= _controller.value.position ?
               _controller.seekTo(Duration(seconds: 1))
               : _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ),
      ]
      );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}