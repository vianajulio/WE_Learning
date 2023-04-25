import 'package:e_learning_dev/ui/pages/forum/widgets/text_check_box.dart';
import 'package:flutter/material.dart';

class Materia extends StatefulWidget {
  const Materia({super.key});

  @override
  State<Materia> createState() => _MateriaState();
}

class _MateriaState extends State<Materia> {
  bool _icon = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ExpansionTile(
        title: const Text('Filtro de Matéria'),
        trailing: Icon(_icon ? Icons.arrow_drop_up : Icons.arrow_drop_down),
        children: <Widget>[
          CustomTextCheckBox(text: 'LMA'),
        ],
        onExpansionChanged: (bool value) {
          setState(() {
            _icon = value;
          });
        },
      ),
    );
  }
}



class Item {
  Item({
    required this.headerText,
    required this.expandedText,
    this.isExpanded = false,
  });
  String headerText;
  String expandedText;
  bool isExpanded;
}
