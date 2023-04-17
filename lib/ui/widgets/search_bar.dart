import 'package:we_learning_dev/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  String hintText;
  double largura;
  double altura;

  SearchBar(
      {super.key,
      required this.hintText,
      this.largura = 48,
      this.altura = 200});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 480,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 8,
              spreadRadius: 1,
              offset: const Offset(0, 5)),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide.none),
          hintText: "Qual matéria vamos estudar?",
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
