import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class NavigationModel extends Model {
  int indexNavigation = 1;
  bool drawerNotification = false;
  static NavigationModel of(BuildContext context) {
    return ScopedModel.of<NavigationModel>(context);
  }

  setState() {
    notifyListeners();
  }

  newIndex(int index, {String? pagina}) {
    indexNavigation = index;
    setState();
  }

  openNotification(AnimationController animationController) {
    drawerNotification = !drawerNotification;

    if (drawerNotification) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    setState();
  }

  //TODO fazer um método que atualize a lista de componentes da sideBar toda vez que é clicado nas notificações
}
