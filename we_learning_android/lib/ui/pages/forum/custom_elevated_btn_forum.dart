import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/topico.dart';

class CustomElevatedBtnForum extends StatefulWidget {
  late final Filtro filtro;
  VoidCallback function;

  CustomElevatedBtnForum({required this.filtro, required this.function});

  @override
  State<CustomElevatedBtnForum> createState() => _CustomElevatedBtnForumState();
}

class _CustomElevatedBtnForumState extends State<CustomElevatedBtnForum> {
  bool? valueCB = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: widget.function,
        child: Text(widget.filtro.tipo),
      ),
    );
  }
}
