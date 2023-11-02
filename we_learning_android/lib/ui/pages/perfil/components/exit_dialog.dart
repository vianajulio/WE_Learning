import 'package:flutter/material.dart';

import '../../../../repository/local/user_local.dart';
import '../../../colors/colors.dart';
import '../../../custom_widgets/global_components/custom_text.dart';
import '../../login/login_page.dart';

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
                    await UserLocal.deleteUser();
                    await Future.delayed(const Duration(milliseconds: 300))
                        .then(
                      (value) => {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        ),
                      },
                    );
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