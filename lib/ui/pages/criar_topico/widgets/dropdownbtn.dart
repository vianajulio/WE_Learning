import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/category_model.dart';
import 'package:we_learning_android/entities/category.dart';
import 'package:we_learning_android/repository/api/category_api.dart';
import 'package:we_learning_android/ui/widgets/message.dart';

<<<<<<< HEAD
class DropDownBTN extends StatelessWidget {
  const DropDownBTN({super.key});
=======
class Test extends StatelessWidget {
  const Test({super.key});
>>>>>>> Jaqueline

  @override
  Widget build(BuildContext context) {
    var listCategories = CategoryApi.instance.getAll();
    return GetBuilder(
      init: CategoryModel(),
<<<<<<< HEAD
      builder: (controller) => SizedBox(
        child: FutureBuilder(
            future: listCategories,
            builder: (context, AsyncSnapshot<List<Category>?> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Message.alert(
                    'Não foi possivel obter os dados necessários',
                  );
                case ConnectionState.waiting:
                  return Message.loading(context);
                default:
                  if (snapshot.hasError) {
                    return Message.alert(
                      'Não foi possível obter os dados do servidor',
                    );
                  } else if (!snapshot.hasData) {
                    return Message.alert(
                      'Não foi possível obter os dados dos topicos',
                    );
                  } else if (snapshot.data!.isEmpty) {
                    return Message.alert(
                      'Nenhum topico encontrado',
                    );
                  } else {
                    return SizedBox(
                      width: 300,
                      child: DropdownButton(
                        onChanged: (String? value) {
                          controller.onPressDropButton(value);
                          listCategories
                              .then((list) => list.forEach((element) {
                                    if (element.name == value) {
                                      controller.updateId(element);
                                    }
                                  }));
                        },
                        value: controller.dropDownValue,
                        items:
                            snapshot.data?.map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                            value: e.name,
                            child: Text(
                              e.name ?? "",
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
              }
            }),
      ),
=======
      builder: (controller) => FutureBuilder(
          future: listCategories,
          builder: (context, AsyncSnapshot<List<Category>?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Message.alert(
                  'Não foi possivel obter os dados necessários',
                );
              case ConnectionState.waiting:
                return Message.loading(context);
              default:
                if (snapshot.hasError) {
                  return Message.alert(
                    'Não foi possível obter os dados do servidor',
                  );
                } else if (!snapshot.hasData) {
                  return Message.alert(
                    'Não foi possível obter os dados dos topicos',
                  );
                } else if (snapshot.data!.isEmpty) {
                  return Message.alert(
                    'Nenhum topico encontrado',
                  );
                } else {
                 return Center(
                   child: DropdownButton(
                      onChanged: (value) {},
                      items: snapshot.data?.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(
                          value: e.name,
                          child: Text(
                            e.name ?? "OI",
                          ),
                        );
                      }).toList(),
                    ),
                 );
                }
            }
          }),
>>>>>>> Jaqueline
    );
  }
}
