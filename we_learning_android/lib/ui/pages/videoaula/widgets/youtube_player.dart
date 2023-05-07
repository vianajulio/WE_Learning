import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomYoutubePlayer extends StatefulWidget {
  // final String? youtubeURL;
  const CustomYoutubePlayer({super.key});

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        loop: true,
        mute: false,
        showFullscreenButton: true,
        showControls: true,
      ),
    );
    _controller.cueVideoById(videoId: 'Rhd8TOxzv6s');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      //Proporção da tela
      aspectRatio: 16 / 9,
      child: YoutubePlayerControllerProvider(
        controller: _controller,
        child: YoutubePlayer(controller: _controller),
      ),
    );
  }
}
