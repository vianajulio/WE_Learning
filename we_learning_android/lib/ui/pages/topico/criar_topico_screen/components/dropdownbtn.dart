import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/entities_controllers/category_model.dart';
import '../../../../../entities/category.dart';
import '../../../../../repository/api/category_api.dart';
import '../../../../custom_widgets/message.dart';

class DropDownBTN extends StatelessWidget {
  const DropDownBTN({super.key});

  @override
  Widget build(BuildContext context) {
    var listCategories = CategoryApi.instance.getAll();
    return GetBuilder(
      init: CategoryModel(),
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
                          listCategories.then((list) => list.forEach((element) {
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
    );
  }
}
