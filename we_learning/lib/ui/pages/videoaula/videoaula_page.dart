import 'package:e_learning_dev/entitites/index_model.dart';
import 'package:e_learning_dev/ui/responsive/responsive.dart';
import 'package:e_learning_dev/ui/widgets/scaffold_basic.dart';
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget video() {
  return Container();
}
