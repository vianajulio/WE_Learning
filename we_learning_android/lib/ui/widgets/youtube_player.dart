import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final String youtubeURL;
  final bool loop;
  final bool mute;
  final bool showFullScreenButton;
  final bool showControls;

  const CustomYoutubePlayer({
    super.key,
    required this.youtubeURL,
    this.loop = false,
    this.mute = false,
    this.showFullScreenButton = false,
    this.showControls = false,
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
        color: 'red',
      ),
    );
    _controller.loadVideo(widget.youtubeURL);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: YoutubePlayer(
        controller: _controller,
        aspectRatio: 16 / 9,
      ),
    );
  }
}