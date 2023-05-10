import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ForumModel extends Model {
  bool sideBar = true;

  static ForumModel of(BuildContext context) {
    return ScopedModel.of<ForumModel>(context);
  }

  setState() {
    notifyListeners();
  }

  openCloseSideBar(AnimationController animIconController,
      AnimationController animSideBarController) {
    sideBar = !sideBar;
    if (sideBar) {
      animIconController.reverse();
      animSideBarController.reverse();
    } else {
      animIconController.forward();
      animSideBarController.forward();
    }
    setState();
  }

  onClickChk(int index, int itemCount) {
    List.generate(itemCount, (index) => null);

    // chkItem = !chkItem;
    setState();
  }
}
