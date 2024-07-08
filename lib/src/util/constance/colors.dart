import 'package:flutter/material.dart';

class AppColor {
  static const primaryColor = Color(0xff006837);
  static const lightGreen = Color.fromARGB(255, 168, 225, 177);
  static const blueColor = Color(0xff0028FC);
  static const redColor = Color.fromARGB(255, 244, 57, 44);
  static const secondaryColor = Color(0xff484848);
  static const backgroundColor = Color(0xff1F1F1F);
  static const textPrimary = Color(0xff232323);
  static const textSecondary = Color(0xff747474);
  static const gold = Color(0xffFFD700);
  static const grey = Color.fromARGB(255, 163, 163, 163);
  static const Color lightGreyColor = Color.fromARGB(255, 186, 186, 186);
  static const Color extraLightGrey = Color(0xFFF2F2F2);
  static List<Color> customColorsList = [
    Colors.grey.shade200,
    const Color.fromARGB(255, 10, 77, 132),
    const Color.fromARGB(255, 244, 57, 44),
    const Color.fromARGB(255, 199, 135, 9),
    Colors.green
  ];

  // static Color color(String name) {
  //   name = name.toLowerCase().trim();
  //   switch (name) {
  //     case 'classic':
  //       return Colors.blue[900]!;
  //     case 'elite':
  //       return const Color(0xff0B6623);
  //     case 'deluxe':
  //       return const Color(0xff35424A);
  //     case 'luxury':
  //       return gold;
  //     default:
  //       return primaryColor;
  //   }
}
