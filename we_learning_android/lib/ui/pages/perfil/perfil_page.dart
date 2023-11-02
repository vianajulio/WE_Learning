import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/entities_controllers/user_model.dart';
import '../../custom_widgets/global_components/custom_text.dart';
import 'components/exit_dialog.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UserModel(),
      builder: (controller) => FutureBuilder(
        future: controller.futureUser,
        builder: (context, snapshot) {
          return snapshot.data?.id == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
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
                          text: snapshot.data!.name!,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 12),
                        CustomText(
                          text: snapshot.data!.email!,
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
                                  return const ExitDialog();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
