import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/model/user_model.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/custom_text_form_field.dart';
import 'package:we_learning_android/ui/pages/main/main_page.dart';
import 'package:we_learning_android/ui/widgets/message.dart';
import 'package:we_learning_android/ui/validator/login_page_validator.dart';

class LoginPage extends StatelessWidget with LoginValidator {
  LoginPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: secondaryWhite,
        body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: ListView(
                children: [
                  Image.asset(
                    'assets/images/senailogo.png',
                    scale: 2,
                  ),
                  const SizedBox(height: 32),
                  CustomText(
                    text: 'Bem vindo!',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  CustomText(
                    text: 'Plataforma de videocurso do senai',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Usuário',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      CustomTexteFormField(
                        hintText: 'senaizerbini@senai.edu.br',
                        textController: _emailController,
                        validator: validateLogin,
                      ),
                      const SizedBox(height: 32),
                      CustomText(
                        text: 'Senha',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      CustomTexteFormField(
                        hintText: '********',
                        textController: _passwordController,
                        validator: validateSenha,
                      ),
                    ],
                  ),
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () {},
                      child: CustomText(
                        text: 'Esqueceu a senha?',
                        color: secondaryBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      _loginOnPress(context);
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(primaryRed)),
                    child: CustomText(
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
      ),
    );
  }

  void _loginOnPress(BuildContext context) {
    FocusScope.of(context).unfocus();

    UserModel().login(
      _emailController.text,
      _passwordController.text,
      onSucess: () {
        Message.onSucess(
          context: context,
          message: 'Usuário logado com sucesso.',
          onPop: (_) {
            Future.delayed(const Duration(milliseconds: 500)).then(
              (value) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const MainPage();
                  },
                ),
              ),
            );
          },
        );
      },
      onFail: () {
        Message.onFail(
          context: context,
          message: 'Não foi possível realizar login.',
          onPop: (_) {
            return;
          },
        );
      },
    );
  }
}
