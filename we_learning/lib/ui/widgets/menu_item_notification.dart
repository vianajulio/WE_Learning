import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class MenuItemNotification extends StatefulWidget {
  String text;
  String notificationText;

  MenuItemNotification({
    super.key,
    required this.text,
    required this.notificationText,
  });

  @override
  State<MenuItemNotification> createState() => _MenuItemNotificationState();
}

class _MenuItemNotificationState extends State<MenuItemNotification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        onPressed: () {
          
        },
        style: ButtonStyle(
            alignment: Alignment.centerLeft,
            padding: MaterialStateProperty.all(EdgeInsets.all(0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const Spacer(),
            widget.notificationText != ""
                ? badges.Badge(
                    badgeContent: SizedBox(
                      width: 12,
                      height: 12,
                      child: Text(
                        widget.notificationText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
