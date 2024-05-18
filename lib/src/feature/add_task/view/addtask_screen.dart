import 'package:app_note_local/src/constant/app_string_constant.dart';

import '../view_model/addtask_view_model_cubit.dart';
import '../view_model/addtask_view_model_state.dart';
import '../../home/view/home_screen.dart';
import '../../../helper/size_gap.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';
import '../../../widget/app_material_button.dart';
import '../../../widget/app_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  AddTaskViewModelCubit viewModel = AddTaskViewModelCubit();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: BlocProvider<AddTaskViewModelCubit>(
        create: (context) => viewModel,
        child: BlocListener<AddTaskViewModelCubit, AddTaskViewModelState>(
          listener: (context, state) {
            if (state is AddTaskViewModelLoading) {}
            if (state is AddTaskViewModelError) {}
            if (state is AddTaskViewModelSuccess) {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.colorBlue,
                  content: Row(
                    children: [
                      Text(
                        taskAdded,
                        style: AppTextStyle.textStyle18,
                      ),
                      Spacer(),
                      Icon(Icons.check_circle, color: AppColors.colorBlack),
                    ],
                  ),
                ),
              );
            }
          },
          child: Column(
            children: [
              Divider(
                color: AppColors.colorBlue,
                endIndent: 130,
                indent: 130,
                thickness: 4,
              ),
              vertical(10),
              Text(
                addTask,
                style: AppTextStyle.textStyle26.copyWith(
                  color: AppColors.colorBlue,
                ),
              ),
              Form(
                key: viewModel.formKey,
                autovalidateMode: viewModel.autovalidateMode,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        vertical(20),
                        AppTextForm(
                          label: title,
                          controller: viewModel.titleController,
                          maxLines: 1,
                          myValidator: (text) {
                            if (text == null || text.isEmpty) {
                              return titleEmpty;
                            }
                            return null;
                          },
                        ),
                        vertical(2),
                        AppTextForm(
                          label: description,
                          controller: viewModel.descriptionController,
                          maxLines: 4,
                          myValidator: (text) {
                            if (text == null || text.isEmpty) {
                              return descriptionEmpty;
                            }
                            return null;
                          },
                        ),
                        ColorsListVIew()
                      ],
                    ),
                  ),
                ),
              ),
              AppMaterialButton(
                onPressed: () {
                  viewModel.addTask();
                },
                title: add,
              ),
              vertical(20),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorsListVIew extends StatefulWidget {
  const ColorsListVIew({
    super.key,
  });

  @override
  State<ColorsListVIew> createState() => _ColorsListVIewState();
}

class _ColorsListVIewState extends State<ColorsListVIew> {
  bool inSelect = false;
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xff007F73),
    Color(0xff4CCD99),
    Color(0xffFFC700),
    Color(0xffFFF455),
    Color(0xffFFAA80),
    Color(0xffFF0080),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddTaskViewModelCubit>(context).currentColor =
                  colors[index];
              setState(() {});
            },
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors[index],
                border: Border.all(
                  color: currentIndex == index
                      ? AppColors.colorWite
                      : Colors.transparent,
                  width: 3,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return horizontal(10);
        },
        itemCount: 6,
      ),
    );
  }
}
