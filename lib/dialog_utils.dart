import 'package:flutter/material.dart';
import 'package:todo_app/app_colors.dart';

class DialogUtils {
  static void showLoading({required BuildContext context, required String message}){
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context){
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(
                  color: AppColors.authPrimaryColor,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(message),
                ),
              ],
            ),
          );
        }
    );
  }

  static void hideLoading(BuildContext context){
    Navigator.pop(context);
  }

  static void showMessage({required BuildContext context, required String message,
    //String title = "",
    Widget? title,
    String? posActionName, Function? posAction,
    String? negActionName, Function? negAction,
    Color? buttonColor
    //Widget? icon
  }) {

    List<Widget> actions = [];
    if(posActionName != null){
      actions.add(ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: AppColors.whiteColor
        ),
          onPressed: (){
            Navigator.pop(context);
            // if(posAction != null){
            //   posAction.call();
            // }
            posAction?.call();
      }, child: Text(posActionName)
      ));
    }
    if(negActionName != null){
      actions.add(ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
            // if(negAction != null){
            //   negAction.call();
            // }
            negAction?.call();
          }, child: Text(negActionName)
      ));
    }

    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Text(message, style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,),
            //title: Text(title),
            title: title,
            actions: actions,
            actionsAlignment: MainAxisAlignment.center,
            //icon: icon,
          );
        }
    );
  }
}