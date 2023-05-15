import 'package:e_learning_dev/ui/pages/forum/forum_page.dart';
import 'package:e_learning_dev/ui/pages/home/home_page.dart';
import 'package:e_learning_dev/ui/pages/videoaula/videoaula_page.dart';
import 'package:flutter/material.dart';

class IndexModel extends ChangeNotifier {
  var index = 0;

  setState() {
    notifyListeners();
  }

  void setIndex(int value) {
    index = value;
    setState();
  }

  void navigation(BuildContext context, int indexPage) {
    List<Widget> pages = [
      HomePage(),
      VideoAulaPage(),
      ForumPage(),
      ForumPage(),
      ForumPage(),
    ];

    print("${pages[indexPage]}");
  }
}
