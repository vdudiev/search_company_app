import 'package:flutter/material.dart';

/// Основная кнопка действия.
class BasicButton extends StatelessWidget {
  /// Колбэк тапа на кнопку
  final VoidCallback? onTap;

  /// Текст кнопки
  final String title;

  const BasicButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    /// Колбэк нажатия на кнопку.

    return Material(
        color: Colors.blue[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
