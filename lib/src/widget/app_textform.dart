import '../utils/app_colors.dart';
import '../utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef Validator = String? Function(String?);

class AppTextForm extends StatefulWidget {
  final String label;

  final bool obscureText;
  final int maxLines;
  final TextEditingController controller;
  final Validator myValidator;

  AppTextForm(
      {required this.label,
      this.obscureText = false,
      required this.controller,
      required this.maxLines,
      required this.myValidator});

  @override
  State<AppTextForm> createState() => _AppTextFormState();
}

class _AppTextFormState extends State<AppTextForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: widget.maxLines,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.colorWite,
        ),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: AppTextStyle.textStyle18.copyWith(
            color: AppColors.colorBlue,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
          enabledBorder:
              customOutLineInputBorder(color: AppColors.colorWite, width: 1),
          focusedBorder:
              customOutLineInputBorder(color: AppColors.colorBlue, width: 1.4),
          errorBorder:
              customOutLineInputBorder(color: AppColors.colorRed, width: 1.6),
        ),
        keyboardType: TextInputType.text,
        controller: widget.controller,
        validator: widget.myValidator,
      ),
    );
  }

  OutlineInputBorder customOutLineInputBorder(
      {required double width, required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        width: width,
        color: color,
      ),
    );
  }
}
