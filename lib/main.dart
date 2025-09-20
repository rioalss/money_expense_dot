// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:money_expense_dot/features/splash/splash_screen.dart';
import 'package:money_expense_dot/shared/gen/fonts.gen.dart';
import 'package:money_expense_dot/shared/services/database_local/hive_service.dart';
import 'package:money_expense_dot/shared/services/injection/dependencies_injection.dart';
import 'package:money_expense_dot/themes/app_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize for Indonesian (id_ID), or you can use 'en_US' etc.
  await initializeDateFormatting('id_ID');

  await HiveService.init();
  DependencyInjection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Money Expense DOT',
          locale: const Locale('id', 'ID'),
          defaultTransition: Transition.fade,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: FontFamily.sourceSansPro,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColor.blue),
            useMaterial3: true,
          ),
          navigatorObservers: [
            FlutterSmartDialog.observer,
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) => FlutterSmartDialog(
            child: MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1)),
              child: child!,
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
