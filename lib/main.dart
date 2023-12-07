import 'package:e_commerce/Login%20Screen/login_screen.dart';
import 'package:e_commerce/Register%20Screen/register.dart';
import 'package:e_commerce/Splash%20Screen/splash_screen.dart';
import 'package:e_commerce/UI/Home/home_screen/home_screen_view.dart';
import 'package:e_commerce/Utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            initialRoute: SplashScreen.routename,
            routes: {
              RegisterScreen.routename: (context) => RegisterScreen(),
              LoginScreen.routename: (context) => LoginScreen(),
              SplashScreen.routename: (context) => SplashScreen(),
              HomeScreenView.routename: (context) => HomeScreenView(),
            },
            debugShowCheckedModeBanner: false,
            theme: MyTheme.lightTheme,
            // darkTheme: MyTheme.darkTheme,
            // themeMode: provider.appTheme,
            // locale: Locale(provider.appLanguage),
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            // supportedLocales: AppLocalizations.supportedLocales,
          );
        });
  }
}
