import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/entities_controllers/user_model.dart';
import '../../../controllers/pages_controllers/loginPageController.dart';
import '../../colors/colors.dart';
import '../../custom_widgets/global_components/custom_text.dart';
import '../../custom_widgets/global_components/custom_text_form_field.dart';
import '../main/default_screen.dart';
import '../../custom_widgets/global_components/message.dart';
import '../../validators/login_page_validator.dart';

class LoginPage extends StatelessWidget with LoginValidator {
  LoginPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _sendEmailController = TextEditingController();
  final _sendEmailFormKey = GlobalKey<FormState>();

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
                      GetBuilder(
                        init: LoginPageController(),
                        builder: (controller) => CustomTextFormFieldObscure(
                          hintText: '********',
                          textController: _passwordController,
                          validator: validateSenha,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
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
                                        child: const Row(
                                          children: [
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
                    ),
                  ),
                  const SizedBox(height: 24),
                  GetBuilder<LoginPageController>(
                    init: LoginPageController(),
                    builder: (controller) {
                      return ElevatedButton(
                        onPressed: () async {
                          controller.onClickBtn();
                          // fetchFromLocalhostAPI();
                          await _loginOnPress(context);
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(primaryRed),
                        ),
                        onLongPress: controller.btnAtv ? () {} : null,
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

  // Future<http.Response> fetchFromLocalhostAPI() async {
  //   final uri = Uri.parse('https://10.0.2.2:7285/api/categoria/listar');
  //   final response = await http.get(uri);

  //   print(response.statusCode);
  //   return response;
  // }

  _loginOnPress(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    showDialog(
      context: context,
      barrierDismissible: false,
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
          duration: 1,
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
        Navigator.of(context).pop();
        Message.onFail(
          context: context,
          message: 'Não foi possível realizar login.',
          onPop: (_) {
            LoginPageController().onClickBtn();
            return;
          },
        );
      },
    );
  }
}
