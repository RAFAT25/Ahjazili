import 'package:flutter/material.dart';

import '../../core/consta/Color.dart';
import '../../core/consta/dimensions.dart';

class NoInternetWidget extends StatelessWidget {
  final VoidCallback onRetry;
  const NoInternetWidget({required this.onRetry});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'image/Internet Connection.gif',
          height: 200,
          width: 300,
          fit: BoxFit.contain,
          cacheWidth: 300,
          cacheHeight: 200,
        ),
        SizedBox(height: AppDimensions.spacingLarge),
        Text(
          "لا يوجد اتصال بالإنترنت",
          style: TextStyle(
            fontSize: AppDimensions.fontSizeXLarge,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppDimensions.spacingMedium),
        ElevatedButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh, color: Colors.white),
          label: Text(
            "إعادة المحاولة",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.color_primary,
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingLarge,
              vertical: AppDimensions.paddingMedium,
            ),
            minimumSize: Size(0, AppDimensions.buttonHeightMedium),
          ),
        ),
      ],
    );
  }
}
