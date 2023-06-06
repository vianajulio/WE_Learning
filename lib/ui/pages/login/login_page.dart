<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/user_model.dart';
import 'package:we_learning_android/controllers/pages_controllers/login_page_controller.dart';
=======
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/user_model.dart';
import 'package:we_learning_android/controllers/pages_controllers/loginpage_controller.dart';
>>>>>>> Jaqueline
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

<<<<<<< HEAD
  final _sendEmailController = TextEditingController();
  final _sendEmailFormKey = GlobalKey<FormState>();

=======
>>>>>>> Jaqueline
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
<<<<<<< HEAD
        backgroundColor: primaryWhite,
=======
        backgroundColor: secondaryWhite,
>>>>>>> Jaqueline
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
<<<<<<< HEAD
                      CustomTextFormField(
=======
                      CustomTexteFormField(
>>>>>>> Jaqueline
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
<<<<<<< HEAD
                      GetBuilder(
                        init: LoginPageController(),
                        builder: (controller) => CustomTextFormFieldObscure(
                          hintText: '********',
                          textController: _passwordController,
                          validator: validateSenha,
                        ),
=======
                      CustomTexteFormField(
                        hintText: '********',
                        textController: _passwordController,
                        validator: validateSenha,
>>>>>>> Jaqueline
                      ),
                    ],
                  ),
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
<<<<<<< HEAD
                      child: const CustomText(
                        text: 'Esqueceu a senha?',
                        color: secondaryBlue,
                        fontWeight: FontWeight.w400,
                      ),
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return Dialog(
                              child: Form(
                                key: _sendEmailFormKey,
                                child: Container(
                                  height: 240,
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomText(
                                        text: 'Digite seu e-mail pessoal',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(height: 14),
                                      CustomTextFormField(
                                        counter: true,
                                        maxLength: 60,
                                        textController: _sendEmailController,
                                        validator: (value) => sendEmail(value),
                                      ),
                                      const SizedBox(height: 32),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (!_sendEmailFormKey.currentState!
                                              .validate()) return;
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Senha enviada, confira seu e-mail",
                                                style: TextStyle(),
                                              ),
                                              duration: Duration(seconds: 3),
                                              backgroundColor: tertiaryBlue,
                                            ),
                                          );
                                        },
                                        style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Colors.red,
                                          ),
                                        ),
                                        child: Row(
                                          children: const [
                                            CustomText(
                                              text: 'Enviar',
                                              color: primaryWhite,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            Spacer(),
                                            Icon(Icons.send)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
=======
                      onPressed: () {},
                      child: const CustomText(
                        text: 'Esqueceu a senha?',
                        color: secondaryBlue,
                      ),
>>>>>>> Jaqueline
                    ),
                  ),
                  const SizedBox(height: 24),
                  GetBuilder<LoginPageController>(
                    init: LoginPageController(),
                    builder: (controller) {
                      return ElevatedButton(
                        onPressed: () async {
<<<<<<< HEAD
                          controller.onClickBtn();
                          await _loginOnPress(context);
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(primaryRed),
                        ),
                        onLongPress: controller.btnAtv ? () {} : null,
=======
                          await _loginOnPress(context);
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(primaryRed)),
>>>>>>> Jaqueline
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

<<<<<<< HEAD
    if (!_formKey.currentState!.validate()) return;

    showDialog(
      context: context,
      barrierDismissible: false,
=======
    showDialog(
      context: context,
>>>>>>> Jaqueline
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
<<<<<<< HEAD
          duration: 1,
=======
>>>>>>> Jaqueline
          onPop: (_) {
            Future.delayed(const Duration(milliseconds: 500)).then(
              (value) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
<<<<<<< HEAD
                    return const MainPage();
=======
                    return MainPage();
>>>>>>> Jaqueline
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
<<<<<<< HEAD
            LoginPageController().onClickBtn();
=======
>>>>>>> Jaqueline
            return;
          },
        );
      },
    );
  }
}
