import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/category_model.dart';
import 'package:we_learning_android/entities/category.dart';
import 'package:we_learning_android/repository/local/category_local.dart';
import 'package:we_learning_android/ui/pages/forum/widgets/custom_radio_btn.dart';

class FiltroMateria extends StatelessWidget {
  const FiltroMateria({super.key});

  @override
  Widget build(BuildContext context) {
    var listCategories = CategoryLocal.instance.getCategory();
    return Flexible(
      child: GetBuilder(
        init: CategoryModel(),
        builder: (controller) => FutureBuilder(
          future: listCategories,
          builder: (context, snapshot) => ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 70,
                child: CustomRadioBtn(
                  category: snapshot.data?[index] ?? Category(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
