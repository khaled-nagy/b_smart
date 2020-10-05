import 'package:b_smart/src/screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:b_smart/ConstantVarables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // PushNotificationService().initialise();
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('en'), Locale('ar')],
    path: "assets/langs",
    startLocale: Locale('ar'),
    //  fallbackLocale: Locale('ar'),
    saveLocale: true,
    // useOnlyLangCode: true,
    // optional assetLoader default used is RootBundleAssetLoader which uses flutter's assetloader
    // assetLoader: RootBundleAssetLoader()
    // assetLoader: NetworkAssetLoader()
    // assetLoader: TestsAssetLoader()
    // assetLoader: FileAssetLoader()
    // assetLoader: StringAssetLoader()
    // preloaderColor: Colors.red,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConstantVarable.lang = EasyLocalization.of(context).locale.toString();
    print("lang is ${ConstantVarable.lang}");
    return MaterialApp(
      title: 'قسيمة',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      theme: ThemeData(
        textTheme: TextTheme(
          subtitle1: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Colors.grey[800],
              fontFamily: 'Tajawal'),
          subtitle2: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
              fontFamily: 'Tajawal'),
          button: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFF41AED9),
              fontFamily: 'Tajawal'),
          headline1: TextStyle(
              fontSize: 18.0,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal'),
          headline2: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF515C6F),
              fontFamily: 'Tajawal'),
          headline3: TextStyle(
              fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Tajawal'),
          headline4: TextStyle(
              fontSize: 14.0, color: Color(0xFF41AED9), fontFamily: 'Tajawal'),
          headline5: TextStyle(
              fontSize: 14.0, color: Color(0xFF515C6F), fontFamily: 'Tajawal'),
          headline6: TextStyle(
              fontSize: 12.0, color: Color(0xFFFFFFFF), fontFamily: 'Tajawal'),
          bodyText1: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Tajawal'),
          bodyText2: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF707070),
              fontWeight: FontWeight.w500,
              fontFamily: 'Tajawal'),
          caption: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF41AED9),
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal'),
        ),

        primarySwatch: Colors.blue,
        accentColor: Color(0xFFFFFFFF),
        focusColor: Color(0xFF8C98A8),
        hintColor: Color(0xFF44444f),
        backgroundColor: Color(0xFF41AED9),
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Color(0xFF41AED9),
        ),
        // canvasColor: Colors.white.withOpacity(0.0),

        fontFamily: 'Tajawal',
      ),
      home:
          //  BlocProvider<ProductCounterBloc>(
          //     create: (context) => ProductCounterBloc(), child:
          SplashScreen()
      // )
      ,
    );
  }
}
