import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/user_model.dart';
import 'package:we_learning_android/repository/local/userLocal.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/pages/login/login_page.dart';
import 'package:we_learning_android/ui/widgets/global_widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/global_widgets/message.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
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
                        const Spacer(),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Material(
                            elevation: 1,
                            child: IconButton(
                                icon: const Icon(Icons.exit_to_app),
                                iconSize: 32,
                                onPressed: () => showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ExitDialog();
                                      },
                                    )
                                //

                                // },
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

class ExitDialog extends StatelessWidget {
  const ExitDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomText(
              text: 'Tem certeza que deseja sair?',
              fontSize: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    //TODO refatorar o cod a baixo e inserir um aviso que está saindo do app
                    // await UserLocal.deleteUser();
                    // await Future.delayed(const Duration(seconds: 3))
                    //     .then((value) => {
                    //           Navigator.of(context).pushReplacement(
                    //             MaterialPageRoute(
                    //               builder: (context) => LoginPage(),
                    //             ),
                    //           ),
                    //           2
                    //         });
                    
                  },
                  child: const CustomText(
                    text: 'Sim',
                    color: primaryWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const CustomText(
                    text: 'Não',
                    color: primaryWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
