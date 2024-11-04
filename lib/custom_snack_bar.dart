import 'package:flutter/material.dart';
import 'package:todo_app/app_colors.dart';
import 'package:todo_app/model/task.dart';

class CustomSnackBar {
  final BuildContext scaffoldCtx;
  final String? title;
  final String? message;
  //final String imagePath;
  final Icon? icon;
  final VoidCallback? onPressed;
  final String? labelTextButton;
  final Task? deletedTask;         // to store the deleted task
  final Color? backgroundColor;
  final Color? textColor; // Custom text color


  CustomSnackBar({
    required this.scaffoldCtx,
    this.title,
    this.message,
    required this.icon,
    this.onPressed,
    this.deletedTask,
    this.labelTextButton,
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
              //Image.asset(imagePath, height: 40, width: 40),
              const SizedBox(width: 10, height: 0),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      // title,
                      title!,
                      style: Theme.of(scaffoldCtx).textTheme.labelLarge!.copyWith(
                        //color: Theme.of(scaffoldCtx).colorScheme.primary,
                        color: textColor,
                      ),
                    ),
                    Text(
                      // message,
                      message!,
                      style: Theme.of(scaffoldCtx).textTheme.labelSmall!.copyWith(
                        //color: Theme.of(scaffoldCtx).colorScheme.primary,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),

              ///vertical line
              Container(
                color: AppColors.whiteColor,
                height: 35,
                width: 1,
                margin: const EdgeInsets.symmetric(horizontal: 5),
              ),

              ///button
              SnackBarAction(
                // label: labelTextButton,
                label: labelTextButton!,
                //textColor: Colors.black,
                textColor: textColor,
                // onPressed: onPressed,
                onPressed: onPressed!,
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