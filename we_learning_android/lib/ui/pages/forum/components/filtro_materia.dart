import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/ui/custom_widgets/message.dart';
import '../../../../controllers/entities_controllers/category_model.dart';
import '../../../../entities/category.dart';
import 'custom_radio_btn.dart';

class FiltroMateria extends StatelessWidget {
  const FiltroMateria({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CategoryModel(),
      builder: (controller) => FutureBuilder(
        future: controller.listCategories,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final categories = snapshot.data as List<Category>;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 70,
                  child: CustomRadioBtn(
                    category: categories[index],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Message.alert("Não foi possível obter os dados do servidor");
          }
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
