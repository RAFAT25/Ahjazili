import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Opens a dialog for verification code input
/// 
/// [context] - The build context
/// 
/// Returns a Future that completes when the dialog is closed
Future<void> openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: AlertDialog(
          title: const Text('رمز التحقق'),
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('أدخل رمز التحقق الذي أرسلناه إلى رقم هاتفك'),
              TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                ],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'رمز التحقق',
                ),
              ),
            ],
          ),
        ),
      ),
    );

