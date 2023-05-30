import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/colors/colors.dart';

class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: primaryWhite,
      onSelected: (value) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              SizedBox(
                width: 200,
                height: 100,
                child: Text("$value"),
              ),
            ],
          ),
        );
      },
      itemBuilder: (_) {
        return [];
      },
    );
  }
}