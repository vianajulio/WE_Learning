import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:we_learning_android/ui/colors/colors.dart';
>>>>>>> 8d2bf56d2674ae44a4aca6b2faa1af16278be5ac
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final String youtubeURL;
  bool loop;
  bool mute;
  bool showFullScreenButton;
  bool showControls;
  bool autoInit;
  CustomYoutubePlayer({
    super.key,
    required this.youtubeURL,
    this.loop = false,
    this.mute = false,
    this.showFullScreenButton = false,
    this.showControls = false,
    this.autoInit = false,
  });

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      params: YoutubePlayerParams(
        loop: widget.loop,
        mute: widget.mute,
        showFullscreenButton: widget.showFullScreenButton,
        showControls: widget.showControls,
        enableJavaScript: false,
<<<<<<< HEAD
      ),
    );

    _controller.load(
      params: YoutubePlayerParams(),
      baseUrl: widget.youtubeURL,
    );
=======
        color: 'red',
      ),
    );

    _controller.loadVideo(widget.youtubeURL);


>>>>>>> 8d2bf56d2674ae44a4aca6b2faa1af16278be5ac

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      //Proporção da tela
      aspectRatio: 16 / 9,
<<<<<<< HEAD
      child: YoutubePlayer(
        controller: _controller,
        enableFullScreenOnVerticalDrag: true,
=======
      child: YoutubePlayerControllerProvider(
        controller: _controller,
        child: YoutubePlayer(controller: _controller),
>>>>>>> 8d2bf56d2674ae44a4aca6b2faa1af16278be5ac
      ),
    );
  }
}
