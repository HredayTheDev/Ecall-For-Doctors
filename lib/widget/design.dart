import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(IconData icons, String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(
      icons,
      color: Colors.black,
    ),
    hintStyle:
        const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide:  const BorderSide(color: Colors.black, width: 2),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const BorderSide(
        color: Color.fromARGB(250, 50, 30, 60),
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const BorderSide(
       color: Color.fromARGB(250, 50, 30, 60),
        width: 2,
      ),
    ),
  );
}
