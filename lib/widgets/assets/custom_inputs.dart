import 'package:flutter/material.dart';



InputDecoration customFieldDecoration(String hintText){

  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Color(0x99FFFFFF)),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Color(0xFFADADAD)),
    ),
    focusedBorder: const OutlineInputBorder(
      // borderSide: BorderSide(width: 2, color: Colors.white),
      borderSide: BorderSide(width: 2, color: Color(0xFFFFC72A)),
    ),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Color(0xFF4C4C4C)),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Color(0xFFC20430)),
    ),
  );
}