import 'package:flutter/material.dart';
import 'package:todo_app/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  String label;
  String? Function(String?)? validator;
  TextInputType keyboardType;
  TextEditingController controller;
  bool obscureText;
  Widget? icon;
  bool isPasswordVisible;
  bool isConfirmPasswordVisible;

  CustomTextFormField({required this.label, required this.validator,
  this.keyboardType = TextInputType.text, required this.controller,
  this.icon, this.obscureText = false, this.isPasswordVisible = false,
  this.isConfirmPasswordVisible = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.authPrimaryColor,
              width: 2
            )
          ),
          // enabledBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(
          //     color: AppColors.authPrimaryColor,
          //     width: 2,
          //   )
          // ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: AppColors.authPrimaryColor,
                  width: 2
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: AppColors.redColor,
                  width: 2
              )
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: AppColors.authPrimaryColor,
                  width: 2
              )
          ),
          labelText: label,
          labelStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: AppColors.labelTextColor,
          ),
          suffixIcon: icon,
        ),
        validator: validator,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,

      ),
    );
  }
}
