import 'package:flutter/material.dart';
import '../../../../entities/topico.dart';
import '../../../custom_widgets/global_components/custom_text.dart';
import '../../../custom_widgets/global_components/custom_text_form_field.dart';

class EditarTopico extends StatelessWidget {
  final Topico topico;
  EditarTopico({super.key, required this.topico});

  final _tituloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _tituloController.text = topico.tituloTopico ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text(topico.tituloTopico ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(text: 'Titulo'),
            CustomTextFormField(
              textController: _tituloController,
            ),
          ],
        ),
      ),
    );
  }
}