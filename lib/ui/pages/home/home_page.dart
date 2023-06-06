import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:we_learning_android/controllers/pages_controllers/bottom_nav_controller.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/widgets/carousel.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/search_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
=======
import 'package:we_learning_android/controllers/entities_controllers/user_model.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
>>>>>>> Jaqueline

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final LatLng currentLocation =
        LatLng(-22.914862218175745, -47.05600610502315);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            const CustomText(
              text: 'Nóticias do Senai',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            CustomCarosel(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              listItens: [
                SizedBox(
                  height: 100,
                  width: 340,
                  child: Image.asset('assets/images/carousel_home_1.png'),
                ),
                SizedBox(
                  height: 100,
                  width: 340,
                  child: Image.asset('assets/images/carousel_home_2.png'),
                ),
                SizedBox(
                  height: 100,
                  width: 340,
                  child: Image.asset('assets/images/carousel_home_3.png'),
                ),
                SizedBox(
                  height: 100,
                  width: 340,
                  child: Image.asset('assets/images/carousel_home_4.png'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            SearchBar(hintText: 'Qual matéria deseja estudar?', largura: 320),
            const SizedBox(height: 24),
            CustomCarosel(
              sideArrow: false,
              listItens: [
                materiaItem(
                  'POO',
                  'Programação Orientada a Objetos',
                  Colors.black54,
                  context,
                ),
                materiaItem(
                  'LMA',
                  'Linguagem de Marcação',
                  Colors.blueGrey,
                  context,
                ),
                materiaItem(
                  'Hare',
                  'Hardware e Redes',
                  Colors.indigo,
                  context,
                ),
                materiaItem(
                  'SOP',
                  'Sistemas Operacionais',
                  Colors.deepPurple,
                  context,
                ),
                materiaItem(
                  'PWE',
                  'Programação Web Back-End',
                  Colors.deepOrangeAccent,
                  context,
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: currentLocation)),
            )
          ],
        ),
      ),
    );
  }
}

Widget materiaItem(
    String titulo, String subtitulo, Color color, BuildContext context) {
  var controller = Get.put(BottomNavBarController());
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
=======
    return GetBuilder<UserModel>(
      init: UserModel(),
      builder: (controller) {
        return const Center(
          child: CustomText(text: 'Home'),
        );
      },
    );
  }
}
>>>>>>> Jaqueline
