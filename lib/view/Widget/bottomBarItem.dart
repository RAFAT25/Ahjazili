import 'package:flutter/material.dart';

import '../../core/consta/Color.dart';

Widget bottomBarItem({
  required String image,
  required String activeImage,
  required String label,
  required bool isActive,
  required VoidCallback onTap,
}) {
  return Expanded(
    child: MaterialButton(
      minWidth: 30,
      onPressed: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            width: isActive ? 30 : 24,
            height: isActive ? 30 : 24,
            child: Image.asset(
              isActive ? activeImage : image,
              color: isActive ? null : Colors.grey[600],
              colorBlendMode: isActive ? null : BlendMode.modulate,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Cairo',
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? AppColor.color_primary : Colors.grey[700],
            ),
          )
        ],
      ),
    ),
  );
}