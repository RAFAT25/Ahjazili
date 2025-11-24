import 'package:flutter/material.dart';

import '../../core/consta/Color.dart';
import '../../core/consta/dimensions.dart';

Widget bottomBarItem({
  required String image,
  required String activeImage,
  required String label,
  required bool isActive,
  required VoidCallback onTap,
}) {
  return Expanded(
    child: InkWell(
      borderRadius: BorderRadius.circular(AppDimensions.radiusXLarge),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.paddingSmall,
          horizontal: AppDimensions.paddingSmall,
        ),
        decoration: BoxDecoration(
          color: isActive
              ? AppColor.primary.withOpacity(0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.radiusXLarge),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 42,
              child: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: isActive ? 34 : 26,
                      height: isActive ? 34 : 26,
                      child: Image.asset(
                        isActive ? activeImage : image,
                        color: isActive ? null : AppColor.textSecondary,
                        colorBlendMode: isActive ? null : BlendMode.srcIn,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 250),
                    bottom: isActive ? -4 : -14,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: isActive ? 1 : 0,
                      child: Container(
                        width: 26,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.spacingXSmall),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Cairo',
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive ? AppColor.primary : AppColor.textSecondary,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}