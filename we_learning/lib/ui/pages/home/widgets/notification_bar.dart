import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:we_learning_dev/models/navigationModel.dart';
import 'package:we_learning_dev/ui/color/colors.dart';
import 'package:we_learning_dev/ui/pages/home/widgets/item_notificacao.dart';
import 'package:we_learning_dev/ui/widgets/custom_text.dart';

class NotificationBar extends StatelessWidget {
  AnimationController animationController;
  Animation animation;
  NotificationBar(
      {super.key, required this.animationController, required this.animation});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<NavigationModel>(
      builder: (context, child, navigationModel) {
        return AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                animation.value * -320,
                0,
              ),
              child: Container(
                color: primaryWhite,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            navigationModel
                                .openNotification(animationController);
                          },
                          icon: Icon(Icons.close_rounded)),
                    ),
                    Center(
                      child: CustomText(
                        text: 'Notificações',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Divider(thickness: 2),
                    Expanded(child: ItemNotificacao()),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget onHidenNotificationBar(NavigationModel navigationModel) {
    bool visivel = true;
    if (navigationModel.drawerNotification == false) {
      return FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)).then(
          (_) => visivel = false,
        ),
        builder: (context, snapshot) {
          return visivel
              ? NotificationBar(
                  animationController: animationController,
                  animation: animation)
              : Container();
        },
      );
    }
    return NotificationBar(
        animationController: animationController, animation: animation);
  }
}
