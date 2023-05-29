import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/category_model.dart';
import 'package:we_learning_android/repository/local/category_local.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    var listCategories = CategoryLocal.instance.getCategory();
    return GetBuilder(
      init: CategoryModel(),
      builder: (controller) => FutureBuilder(
        future: listCategories,
        builder: (context, snapshot) => ListView.builder(
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            return Text(snapshot.data?[index].name ?? "");
          },
        ),
      ),
    );
  }
}
