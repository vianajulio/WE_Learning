<<<<<<< HEAD:we_learning/lib/ui/pages/videoaula/videoaula_page.dart
import 'package:e_learning_dev/entitites/index_model.dart';
import 'package:e_learning_dev/ui/responsive/responsive.dart';
import 'package:e_learning_dev/ui/widgets/scaffold_basic.dart';
=======
import 'package:we_learning_dev/ui/responsive/responsive.dart';
import 'package:we_learning_dev/ui/widgets/scaffold_basic.dart';
>>>>>>> julio:lib/ui/pages/videoaula/videoaula_page.dart
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoAulaPage extends StatefulWidget {
  const VideoAulaPage({super.key});

  @override
  State<VideoAulaPage> createState() => _VideoAulaPageState();
}

class _VideoAulaPageState extends State<VideoAulaPage> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD:we_learning/lib/ui/pages/videoaula/videoaula_page.dart
    return ScaffoldBasic(
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: [
            SizedBox(
              height: constraints.maxHeight,
              child: Center(
                child: responsiveLayout(
                  constraints,
                  video(),
                  video(),
                  const Text("Mobile"),
                ),
=======
    return LayoutBuilder(
      builder: (context, constraints) => ListView(
        children: [
          SizedBox(
            height: constraints.maxHeight,
            child: Center(
              child: responsiveLayout(
                constraints,
                const Text("Desktop"),
                const Text("Tablet"),
                const Text("Mobile"),
>>>>>>> julio:lib/ui/pages/videoaula/videoaula_page.dart
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget video() {
  return Container();
}
