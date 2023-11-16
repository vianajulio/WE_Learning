import 'package:flutter/material.dart';
import 'package:we_learning_android/constants/constants.dart';

import '../../custom_widgets/scaffold_custom.dart';
import 'components/card_video_aula.dart';

class AulasPage extends StatelessWidget {
  const AulasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      drawer: const SafeArea(child: Drawer()),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: titleCourses.length,
          itemBuilder: (context, index) {
            return CardAula(
              title: titleCourses[index],
              icon: iconCourses[index],
            );
          },
        ),
      ),
    );
  }
}
