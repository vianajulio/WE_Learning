import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:we_learning_dev/models/navigationModel.dart';

class MenuItem extends StatelessWidget {
  String text;
  int index;

  MenuItem({super.key, this.text = "", required this.index});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<NavigationModel>(
      builder: (context, child, navigationModel) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          onTap: () {
            navigationModel.newIndex(index);
          },
        );
      },
    );
  }
}
