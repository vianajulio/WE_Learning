import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final String hintText;
  final double largura;
  final double altura;

<<<<<<< HEAD
  SearchBar({
    super.key,
    required this.hintText,
    this.largura = 200,
    this.altura = 48,
  });
=======
  const CustomSearchBar(
      {super.key,
      required this.hintText,
      this.largura = 48,
      this.altura = 200});
>>>>>>> gabriel

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.largura,
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
          hintText: widget.hintText,
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
