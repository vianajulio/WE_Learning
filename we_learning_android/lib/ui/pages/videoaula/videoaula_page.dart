import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/pages/videoaula/widgets/youtube_player.dart';

class VideoaulaPage extends StatefulWidget {
  const VideoaulaPage({super.key});

  @override
  State<VideoaulaPage> createState() => _VideoaulaPageState();
}

class _VideoaulaPageState extends State<VideoaulaPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomYoutubePlayer(
          youtubeURL: 'https://www.youtube.com/watch?v=P5vn5EsAuOs',
        ),
      ),
    );
  }
}
