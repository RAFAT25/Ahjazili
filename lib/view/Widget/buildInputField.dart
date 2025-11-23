import 'package:flutter/material.dart';

import '../../core/consta/Color.dart';

Widget buildInputField(
final String? Function(String?)validator,
    TextEditingController controller,
    String label,
    IconData icon,
    bool obscure,
    double borderRadius, {
      Widget? suffixIcon,
      void Function(String)? onChanged,
    }) {
  return Container(
    margin: const EdgeInsets.only(bottom: 0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 2,
            spreadRadius: 1)
      ],
    ),
    child: TextFormField(
      validator:validator ,
      controller: controller,
      obscureText: obscure,
      textAlign: TextAlign.right,
      style: const TextStyle(fontFamily: 'Cairo', fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle:  TextStyle(fontFamily: 'Cairo', fontSize: 15,color:  AppColor.color_primary),
        prefixIcon: Icon(icon, size: 22,color:  AppColor.color_primary,),
        suffixIcon: suffixIcon,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      ),
      onChanged: onChanged,
    ),
  );
}

