import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:we_learning_android/entities/aula.dart';
import 'package:we_learning_android/entities/category.dart';
import 'package:we_learning_android/ui/pages/videoaula/videoaula_page.dart';
import '../../../controllers/entities_controllers/category_model.dart';
import '../../../repository/local/category_local.dart';
import '../../widgets/card_categoria.dart';

class VideoaulasPage extends StatelessWidget {
  const VideoaulasPage({super.key});

  @override
  Widget build(BuildContext context) {
    var icons = [
      MdiIcons.youtube,
      MdiIcons.languageHtml5,
      MdiIcons.languageJava,
      MdiIcons.cellphoneLink,
      MdiIcons.languageCsharp,
      MdiIcons.penguin,
      MdiIcons.fileDocumentCheckOutline,
      MdiIcons.github,
      MdiIcons.android,
      MdiIcons.checkboxMarkedCircleOutline,
    ];
    // var listCategories = CategoryLocal.instance.getCategory();
    // Category category =
    //     Category(id: 1, name: "PRO", description: "....", pierSitReg: "ATV");
    return SafeArea(
      child: Expanded(
        child: Flexible(
          child: GetBuilder(
            init: CategoryModel(),
            builder: (controller) => FutureBuilder(
              future: controller.futureCategories,
              builder: (context, snapshot) => GridView.count(
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                childAspectRatio: .90,
                children: List.generate(snapshot.data?.length ?? 0, (index) {
                  return InkWell(
                    child: InkWell(
                      child: CardCategoria(
                        categoria: snapshot.data?[index] ?? Category(),
                        icon: icons[index],
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const VideoaulaPage())),
                    ),
                    onTap: () {
                      print('Teste');
                    },
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
