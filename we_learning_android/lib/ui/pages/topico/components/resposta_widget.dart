import 'package:flutter/material.dart';

import '../../../../controllers/entities_controllers/respostas_model.dart';
import '../../../../entities/resposta.dart';
import '../../../../entities/topico.dart';
import '../../../../entities/user.dart';
import '../../../../repository/local/user_local.dart';
import '../../../colors/colors.dart';
import '../../../custom_widgets/global_components/custom_text.dart';
import '../../../custom_widgets/global_components/custom_text_form_field.dart';
import '../../../custom_widgets/global_components/message.dart';

class RespostaWidget extends StatelessWidget {
  final Topico topico;
  RespostaWidget({super.key, required this.topico});

  final _descricaoResposta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                  textController: _descricaoResposta,
                  counter: true,
                  maxLines: 50,
                  maxLength: 1400,
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        cadastrarResposta(context);
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
      ),
    );
  }

  cadastrarResposta(BuildContext context) async {
    FocusScope.of(context).unfocus();

    User? usuario = await UserLocal.getUser();
    Resposta resposta;

    if (usuario?.id != null) {
      resposta = Resposta(
        idTopico: topico.id,
        conteudoResposta: _descricaoResposta.text,
        usuario: usuario!.id.toString(),
      );
      RespostaModel().post(
        resposta,
        onSucess: () => Message.onSucess(
          context: context,
          message: 'Resposta cadastada com sucesso.',
          duration: 3,
          onPop: (_) {
            Navigator.of(context).canPop();
          },
        ),
        onFail: () => Message.onFail(
            context: context, message: 'Erro ao cadastar', duration: 3),
      );
    }
  }
}
