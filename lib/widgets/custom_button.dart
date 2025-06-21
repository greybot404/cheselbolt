import 'package:flutter/material.dart';

enum ButtonVariant { primary, secondary, outline }

enum ButtonSize { small, medium, large }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final Widget? icon;
  final bool isLoading;
  final bool fullWidth;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Color backgroundColor;
    Color foregroundColor;
    BorderSide? borderSide;

    switch (variant) {
      case ButtonVariant.primary:
        backgroundColor = Colors.black;
        foregroundColor = Colors.white;
        borderSide = null;
        break;
      case ButtonVariant.secondary:
        backgroundColor = Colors.grey[100]!;
        foregroundColor = Colors.grey[900]!;
        borderSide = null;
        break;
      case ButtonVariant.outline:
        backgroundColor = Colors.transparent;
        foregroundColor = Colors.black;
        borderSide = const BorderSide(color: Colors.black, width: 2);
        break;
    }

    double padding;
    double fontSize;

    switch (size) {
      case ButtonSize.small:
        padding = 12;
        fontSize = 14;
        break;
      case ButtonSize.medium:
        padding = 16;
        fontSize = 16;
        break;
      case ButtonSize.large:
        padding = 20;
        fontSize = 18;
        break;
    }

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          side: borderSide,
          padding: EdgeInsets.symmetric(
            horizontal: padding * 1.5,
            vertical: padding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                height: fontSize + 4,
                width: fontSize + 4,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'LibreBaskerville',
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}