import 'package:flutter/material.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

class RoundedButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final String text;
  final OnViewClickListener? onClick;
  final double? width, height;
  final dynamic leadingIcon;
  final bool loading;

  const RoundedButton({
    super.key,
    this.buttonColor,
    this.textColor,
    required this.text,
    this.onClick,
    this.width,
    this.height,
    this.leadingIcon,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return StackLayout(
      width: width,
      children: [
        Button(
          pressedColor: Colors.black12,
          borderRadius: 24,
          text: loading ? "" : text,
          textColor: textColor,
          textSize: 16,
          textFontWeight: FontWeight.w600,
          width: double.infinity,
          height: height,
          icon: leadingIcon,
          background: buttonColor,
          iconAlignment: IconAlignment.start,
          onClick: onClick,
        ),
        if (loading)
          const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}
