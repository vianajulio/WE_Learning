import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/user_model.dart';
import 'package:we_learning_android/controllers/pages_controllers/loginpage_controller.dart';
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
        backgroundColor: primaryWhite,
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
                    children: [
                      const CustomText(
                        text: 'Usuário',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      CustomTextFormField(
                        hintText: 'senaizerbini@senai.edu.br',
                        textController: _emailController,
                        validator: validateLogin,
                      ),
                      const SizedBox(height: 32),
                      const CustomText(
                        text: 'Senha',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      CustomTextFormField(
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
                      child: const CustomText(
                        text: 'Esqueceu a senha?',
                        color: secondaryBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  GetBuilder<LoginPageController>(
                    init: LoginPageController(),
                    builder: (controller) {
                      return ElevatedButton(
                        onPressed: () async {
                          await _loginOnPress(context);
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(primaryRed)),
                        child: const CustomText(
                          text: 'Login',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primaryWhite,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _loginOnPress(BuildContext context) {
    FocusScope.of(context).unfocus();

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

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
                    return MainPage();
                  },
                ),
              ),
            );
          },
        );
      },
      onFail: () {
        Navigator.of(context).pop();
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
