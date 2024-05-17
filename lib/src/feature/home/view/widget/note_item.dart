import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_textstyles.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.colorYellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                "Flutter tips",
                style: AppTextStyle.textStyle26,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                "Tips and tricks for Flutter development ",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.textStyle18,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: AppColors.colorRed,
                  size: 30,
                ),
              ),
            ),
            Text("16/01/2023", style: AppTextStyle.textStyle18),
          ],
        ),
      ),
    );
  }
}
