import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/on_click_element.dart';
import '../../custom_widgets/scaffold_custom.dart';
import '../../custom_widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var logger = Logger();

    return ScaffoldCustom(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                const CustomSearchBar(
                  largura: double.infinity,
                  hintText: 'Qual matéria deseja estudar?',
                ),
                const SizedBox(height: 48),
                Onclickelement(
                  width: width,
                  height: 200,
                  innerWidget: const Center(
                    child: CustomText(
                      text: 'Continuar assistindo.',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  color: tertiaryWhite,
                  function: () {},
                ),
                const SizedBox(
                  height: 64,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const CustomText(text: 'Dúvida mais votada:'),
                ),
                const SizedBox(
                  height: 8,
                ),
                Onclickelement(
                  width: width,
                  height: 120,
                  function: () {},
                  color: tertiaryWhite,
                  innerWidget: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: const Icon(Icons.account_circle, size: 54),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.only(top: 16),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: 'Titulo'),
                              SizedBox(height: 8),
                              CustomText(text: 'Descrição'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    logger.d("message");
                  },
                  child: CustomText(
                    text: 'Ver mais...',
                    fontWeight: FontWeight.w500,
                    color: Colors.blue.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
