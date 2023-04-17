import 'package:we_learning_dev/ui/responsive/responsive.dart';
import 'package:we_learning_dev/ui/widgets/scaffold_basic.dart';
import 'package:flutter/material.dart';

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
                  const Text("Desktop"),
                  const Text("Tablet"),
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
