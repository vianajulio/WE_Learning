import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/custom_text_form_field.dart';

class RespostaWidget extends StatelessWidget {
  final Topico topico;
  const RespostaWidget({super.key, required this.topico});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          const CustomText(text: 'Tópico:'),
                          CustomText(
                            text: topico.tituloTopico ?? "",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 32),
                          const CustomText(
                            text: 'Descreva a sua resposta:',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(height: 14),
                          CustomTextFormField(
                            counter: true,
                            maxLines: 50,
                            maxLength: 850,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  //TODO criar método cadastrar resposta
                                },
                                child: const CustomText(
                                  text: 'Responder',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: primaryWhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
  }
}
