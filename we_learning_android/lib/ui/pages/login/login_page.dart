import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/custom_text_form_field.dart';
import 'package:we_learning_android/ui/pages/main/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryWhite,
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: ListView(
              children: [
                Image.asset(
                  'assets/images/senailogo.png',
                  scale: 2,
                ),
                const SizedBox(height: 32),
                const CustomText(
                  text: 'Bem vindo!',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                const CustomText(
                  text: 'Plataforma de videocurso do senai',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomText(
                      text: 'Usuário',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    CustomTexteFormField(hintText: 'senaizerbini@senai.edu.br'),
                    SizedBox(height: 32),
                    CustomText(
                      text: 'Senha',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    CustomTexteFormField(hintText: '********'),
                  ],
                ),
                Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {},
                    child: const CustomText(
                      text: 'Esqueceu a senha?',
                      color: secondaryBlue,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(primaryRed)),
                  child: const CustomText(
                    text: 'Login',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryWhite,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
