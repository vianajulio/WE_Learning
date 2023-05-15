import 'package:flutter/material.dart';

//Tamanhos utilizados para a responsividade do app
const mobileWidth = 426;
const desktopWidth = 1023;

Widget responsiveLayout(
    BoxConstraints constraints, Widget desktop, Widget tablet, Widget mobile) {
  if (constraints.maxWidth <= mobileWidth) {
    return mobile;
  }
  if (constraints.maxWidth >= desktopWidth) {
    return desktop;
  }
  return tablet;
}
