import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/user_model.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
