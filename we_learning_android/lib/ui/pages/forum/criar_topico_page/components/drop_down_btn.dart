import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../custom_widgets/custom_text.dart';
import '../../../../../controllers/entities_controllers/category_model.dart';
import '../../../../../entities/category.dart';
import '../../../../custom_widgets/message.dart';

class DropDownBTN extends StatelessWidget {
  const DropDownBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CategoryModel(),
      builder: (controller) => SizedBox(
        child: FutureBuilder(
          future: controller.listCategories,
          builder: (context, AsyncSnapshot<List<Category>?> snapshot) {
            if (snapshot.hasData) {
              final categorias = snapshot.data as List<Category>;
              return SizedBox(
                width: 300,
                child: FormField(
                  builder: (field) => DropdownButtonFormField(
                    hint: const CustomText(text: "Selecione um item"),
                    onChanged: (value) {
                      controller.onPressDropButton(value ?? "");
                    },
                    items: categorias.map<DropdownMenuItem<String>>((value) {
                      print(value);
                      return DropdownMenuItem(
                        value: value.name,
                        child: Text(value.name ?? "nada"),
                      );
                    }).toList(),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Message.alert(
                'Não foi possível obter os dados do servidor',
              );
            }
            return Message.loading(context);
          },
        ),
      ),
    );
  }
}
