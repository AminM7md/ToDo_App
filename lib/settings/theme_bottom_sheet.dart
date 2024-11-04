import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/app_colors.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      height: 250,
      decoration: BoxDecoration(
        ///bottom sheet appear color
        color: provider.appTheme == ThemeMode.light
            ? AppColors.whiteColor
            : AppColors.primaryDarkColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  ///change theme to light
                  provider.changeTheme(ThemeMode.light);
                },

                ///select light
                child: provider.appTheme == ThemeMode.light
                    ? getSelectedItemWidget(AppLocalizations.of(context)!.light)
                    : getUnSelectedItemWidget(AppLocalizations.of(context)!.light)
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
                onTap: () {
                  ///change theme to dark
                  provider.changeTheme(ThemeMode.dark);
                },

                ///select dark
                child: provider.appTheme == ThemeMode.dark
                    ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                    : getUnSelectedItemWidget(AppLocalizations.of(context)!.dark)
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
                  color: provider.appTheme == ThemeMode.light
                      ? AppColors.primaryColor
                      : AppColors.primaryColor,
                )
        ),
        Icon(
          Icons.check_circle_outline_rounded,
          color: provider.appTheme == ThemeMode.light
              ? AppColors.primaryColor
              : AppColors.primaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: provider.appTheme == ThemeMode.light
                  ? AppColors.blackColor
                  : AppColors.whiteColor,
            )
            ),
      ],
    );
  }
}
