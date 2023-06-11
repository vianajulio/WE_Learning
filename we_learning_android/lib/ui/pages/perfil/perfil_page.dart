import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/user_model.dart';
import 'package:we_learning_android/repository/local/user_local.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/pages/login/login_page.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/message.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const CustomText(
                  text: "Sair",
                  fontSize: 18,
                  color: primaryWhite,
                  fontWeight: FontWeight.w500,
                ),
                IconButton(
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
              ],
            ),
          ),
        ],
      ),
      body: GetBuilder(
        init: UserModel(),
        builder: (controller) => FutureBuilder(
          future: controller.futureUser,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Message.loading(context);
              default:
                if (snapshot.hasError) {
                  return Message.alert(
                    'Não foi possível obter os dados do servidor',
                  );
                } else if (!snapshot.hasData) {
                  return Message.alert(
                    'Não foi possível obter os dados dos topicos',
                  );
                } else {
                  return SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.account_circle,
                            ),
                            onPressed: () {},
                            iconSize: 128,
                            splashColor: Colors.red.shade100,
                            splashRadius: 50,
                            style: const ButtonStyle(
                              splashFactory: InkSplash.splashFactory,
                            ),
                          ),
                          const SizedBox(height: 12),
                          CustomText(
                            text: snapshot.data?.name ?? "Não localizado",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(height: 12),
                          CustomText(
                            text: snapshot.data?.email ?? "Não localizado",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
