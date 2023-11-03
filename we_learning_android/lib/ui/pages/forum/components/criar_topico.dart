import 'package:flutter/material.dart';
import '../../../../controllers/entities_controllers/topic_model.dart';
import '../../../colors/colors.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../custom_widgets/custom_text_form_field.dart';
import '../../../custom_widgets/message.dart';
import '../../../validators/criar_topico_validator.dart';
import '../../topico/components/drop_down_btn.dart';



class CadastrarTopico extends StatelessWidget {
  CadastrarTopico({super.key});

  final _tituloController = TextEditingController();
  final  _descricaoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                CustomTextFormField(
                  counter: true,
                  maxLength: 40,
                  textController: _tituloController,
                  validator: CriarTopicoValidator.validateInput,
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
                CustomTextFormField(
                  textController: _descricaoController,
                  maxLines: 24,
                  maxLength: 1400,
                  counter: true,
                  validator: CriarTopicoValidator.validateInput,
                ),
      
                //DropDown
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  child: const DropDownBTN(),
                ),
      
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 44,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        cadastrarTopic(context);
                      },
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
      ),
    );
  }

  void cadastrarTopic(BuildContext context) {
    FocusScope.of(context).unfocus();
    
    if (!_formKey.currentState!.validate()) return;

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    TopicModel().post(
      _tituloController.text,
      _descricaoController.text,
      onSucess: () => Message.onSucess(
        context: context,
        message: 'Topico cadastrado com sucesso.',
        onPop: (_) {
          Navigator.of(context).pop();
        },
      ),
      onFail: () => Message.onFail(
        context: context,
        message: "Falha ao cadastrar.",
        onPop: (_) {
          return;
        },
      ),
    );

    

  }
}