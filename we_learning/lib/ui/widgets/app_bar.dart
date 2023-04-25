import 'package:flutter/material.dart';
import 'package:e_learning_dev/ui/color/colors.dart';

AppBar appBarDesktop() {
  return AppBar(
    automaticallyImplyLeading: false,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Image.asset(
          "assets/images/senailogo.png",
          width: 200,
        ),
      ),
      const Spacer(),
      Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.red.shade700,
              size: 32,
            ),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ),
    ],
    backgroundColor: primaryWhite,
  );
}
