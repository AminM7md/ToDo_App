import 'package:flutter/material.dart';
import 'package:todo_app/app_colors.dart';

class CustomSnackBarWithoutActions {
  final BuildContext scaffoldCtx;
  final String? title;
  final String? message;
  final Icon? icon;
  final Color? backgroundColor;
  final Color? textColor; // Custom text color


  CustomSnackBarWithoutActions({
    required this.scaffoldCtx,
    this.title,
    this.message,
    this.icon,
    this.backgroundColor = Colors.black, // Default background color
    this.textColor = Colors.white
  });

  void showSnackBar() {
    ScaffoldMessenger.of(scaffoldCtx).showSnackBar(SnackBar(
      elevation: 0,
      content: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 1,
        child:
        ///snack bar design
        Container(
          color: AppColors.snackBarColor, //snack bar color
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              const SizedBox(width: 5, height: 0),
              icon!,
              const SizedBox(width: 10, height: 0),
              ///vertical line
              Container(
                color: AppColors.whiteColor,
                height: 35,
                width: 1,
                margin: const EdgeInsets.symmetric(horizontal: 5),
              ),
              const SizedBox(width: 10, height: 0),
              Text(
                // title,
                title!,
                style: Theme.of(scaffoldCtx).textTheme.labelLarge!.copyWith(
                  //color: Theme.of(scaffoldCtx).colorScheme.primary,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 3),
    ));
  }
}