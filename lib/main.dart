import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/authentication/login/login_screen.dart';
import 'package:todo_app/authentication/register/register_screen.dart';
import 'package:todo_app/home/home_screen.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/providers/auth_user_provider.dart';
import 'package:todo_app/providers/list_provider.dart';
import 'package:todo_app/task_list/edit_task_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final String? savedLanguage = sharedPreferences.getString("appLanguage");
  final bool? theme = sharedPreferences.getBool("appTheme");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseFirestore.instance.disableNetwork(); //to run offline
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppConfigProvider(
            appLanguage: savedLanguage ?? "en", mode: theme ?? false),
        ),
        ChangeNotifierProvider(
          create: (context) => ListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthUserProvider(),
        ),
      ],
      child: MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        EditTaskScreen.routeName : (context) => EditTaskScreen(),
        RegisterScreen.routeName : (context) => RegisterScreen(),
        LoginScreen.routeName : (context) => LoginScreen(),
      },
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}