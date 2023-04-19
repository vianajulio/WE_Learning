import 'package:we_learning_dev/ui/responsive/responsive.dart';
import 'package:we_learning_dev/ui/widgets/scaffold_basic.dart';
import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ListView(
        children: [
          SizedBox(
            height: constraints.maxHeight,
            child: Center(
              child: responsiveLayout(
                constraints,
                Text("Desktop"),
                Text("Tablet"),
                Text("Mobile"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
