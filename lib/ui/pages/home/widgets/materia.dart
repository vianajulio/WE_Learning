import 'package:flutter/material.dart';

class Materia extends StatelessWidget {
  int? id;
  Materia({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: largura / 72),
      child: InkWell(
        child: Container(
          width: largura / 7,
          color: Colors.blue,
        ),
        onTap: () {
          print("Ir para aula ${id}");
        },
      ),
    );
  }
}
