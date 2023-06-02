import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:we_learning_android/controllers/entities_controllers/user_model.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/widgets/carousel.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/google_maps.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              listItens: const [
                ColoredBox(
                  color: secondaryRed,
                  child: SizedBox(
                    height: 100,
                    width: 300,
                  ),
                ),
                ColoredBox(
                  color: secondaryBlue,
                  child: SizedBox(
                    height: 100,
                    width: 300,
                  ),
                ),
                ColoredBox(
                  color: secondaryBlack,
                  child: SizedBox(
                    height: 100,
                    width: 300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Container(width: 100, height: 100, child: const CustomGoogleMaps()),
          ],
        ),
      ),
    );
  }
}
