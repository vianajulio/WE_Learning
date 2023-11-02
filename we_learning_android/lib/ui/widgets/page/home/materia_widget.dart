import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/pages_controllers/bottom_nav_controller.dart';
import '../../../colors/colors.dart';
import '../../global_widgets/custom_text.dart';

class MateriaItem extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final Color color;

  const MateriaItem({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    BottomNavBarController controller = Get.put(BottomNavBarController());

    return InkWell(
      child: Container(
        color: color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: titulo,
                color: primaryWhite,
              ),
              CustomText(
                text: subtitulo,
                color: primaryWhite,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        controller.goToTab(2);
      },
    );
  }
}
