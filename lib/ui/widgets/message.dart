import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/colors/colors.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static void onSucess(
      {required BuildContext context,
      required String message,
      int duration = 3,
      Function(dynamic)? onPop}) async {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(),
        ),
        duration: Duration(seconds: duration),
        backgroundColor: primaryBlue,
      ),
    );

    if (onPop != null) {
      Future.delayed(
        Duration(seconds: duration),
      ).then(
        onPop,
      );
    }
    Navigator.of(context).pop();
  }

  static void onFail(
      {required BuildContext context,
      required String message,
      int duration = 3,
      Function(dynamic)? onPop}) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: duration),
        backgroundColor: primaryRed,
      ),
    );
    if (onPop != null) {
      Future.delayed(
        Duration(seconds: duration),
      ).then(
        onPop,
      );
    }
    Navigator.of(context).pop();
  }

  static Widget loading(BuildContext context,
      {double? width, double? height, double? strokeWidth, Color? color}) {
    return Center(
      child: SizedBox(
        width: width ?? 40.0,
        height: height ?? 40.0,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? Theme.of(context).primaryColor,
          ),
          strokeWidth: strokeWidth ?? 5.0,
        ),
      ),
    );
  }

  static Widget alert(
    String message, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Center(
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            fontSize: fontSize ?? 18.0,
            color: color ?? Colors.grey,
            fontWeight: fontWeight ?? FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
