import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/category.dart';
import 'package:we_learning_android/repository/local/category_local.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/custom_text_form_field.dart';

class CadastrarTopico extends StatefulWidget {
   CadastrarTopico({super.key});

  @override
  State<CadastrarTopico> createState() => _CadastrarTopicoState();
}

class _CadastrarTopicoState extends State<CadastrarTopico> {

  @override
  Future<void> initState() async {
    List<Category>? categorias = await CategoryLocal.instance.getCategory();
    
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Titulo:',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const CustomText(
                text: 'Coloque um título que correspoda a sua dúvida.',
              ),
              CustomTexteFormField(
                counter: true,
                maxLength: 40,
              ),
              const SizedBox(height: 24),
              const CustomText(
                text: 'Descrição:',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const CustomText(
                text:
                    'Descreva sua dúvida de forma que o leitor consiga enteder o seu caso.',
                maxLines: 2,
              ),
              const SizedBox(height: 14),
              CustomTexteFormField(
                maxLines: 16,
                maxLength: 840,
                counter: true,
              ),

              //DropDown
              
              
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 44,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const CustomText(
                      text: 'Cadastrar',
                      color: primaryWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
