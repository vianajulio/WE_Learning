import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/model/materia_controller.dart';
import 'package:we_learning_android/ui/pages/forum/custom_check_box.dart';

class Materia extends StatelessWidget {
  List<String> textCheckBox;
  Materia({super.key, required this.textCheckBox});

  bool _icon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GetBuilder<MateriaController>(
        init: MateriaController(),
        builder: (controller) => ExpansionTile(
        title: const Text('TITULO'),
        trailing: Icon(_icon ? Icons.arrow_drop_up : Icons.arrow_drop_down),
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CustomTextCheckBox(text: 'LMA');
            },
          ),
          // CustomTextCheckBox(text: 'LMA')
        ],
        onExpansionChanged: (bool value) {
          _icon = value;
          controller.expansionChanged;
        },
          ),
      ),
    );
  }
}

// class Item {
//   Item({
//     required this.headerText,
//     required this.expandedText,
//     this.isExpanded = false,
//   });
//   String headerText;
//   String expandedText;
//   bool isExpanded;
// }
