import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/custom_widgets/custom_text.dart';
import 'package:we_learning_android/ui/custom_widgets/scaffold_custom.dart';
import '../../custom_widgets/carousel.dart';
import '../../custom_widgets/search_bar.dart';
import 'components/materia_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ScaffoldCustom(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                CustomSearchBar(
                  largura: (width * 80) / 100,
                  hintText: 'Qual matéria deseja estudar?',
                ),
                const SizedBox(height: 48),
                Container(
                  color: Colors.grey,
                  width: width,
                  height: 200,
                  child: const Center(
                    child: CustomText(
                      text: 'Continuar assistindo.',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
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
                Container(
                  width: width,
                  height: 120,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                    // borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
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
                TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: 'Ver mais...',
                    fontWeight: FontWeight.w500,
                    color: Colors.blue.shade600,
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
