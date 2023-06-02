import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/user_model.dart';
import 'package:we_learning_android/entities/user.dart';
import 'package:we_learning_android/repository/local/user_local.dart';
import 'package:we_learning_android/ui/pages/login/login_page.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () async {
                await UserLocal.deleteUser();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
          children: [
            const Icon(
              Icons.account_circle,
              size: 128,
            ),
            // CustomText(text: controller.user!.name ?? ''),
            // CustomText(text: controller.user!.email ?? ''),
            // CustomText(text: controller.user!.email ?? ''),
            
          ],
        ),
    );
  }
}
