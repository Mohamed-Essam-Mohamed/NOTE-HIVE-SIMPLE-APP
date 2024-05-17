import 'package:app_note_local/src/utils/app_colors.dart';
import 'package:app_note_local/src/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

class AppMaterialButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const AppMaterialButton({
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.colorBlue,
      minWidth: double.infinity,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          title,
          style: AppTextStyle.textStyle26.copyWith(color: AppColors.colorBlack),
        ),
      ),
    );
  }
}
