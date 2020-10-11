import 'package:b_smart/src/screens/splash_screen.dart';
import 'package:b_smart/src/statemanagment/Change_Language.dart';
import 'package:b_smart/src/statemanagment/selectRequestType.dart';
import 'package:b_smart/src/statemanagment/show_Attendance.dart';
import 'package:easy_localization/easy_localization.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
 void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // PushNotificationService().initialise();
  runApp( 
       EasyLocalization(
      child: MyApp(),
      supportedLocales: [Locale('en'), Locale('ar')],
      path: "assets/langs",
      startLocale: Locale('en'),
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectRequest>(create: (context) { 
              return SelectRequest();
         },),
         ChangeNotifierProvider<ChangeLanguage>(create: (context) { 
              return ChangeLanguage();
         },),
            ChangeNotifierProvider<ShowAttendance>(create: (context) { 
              return ShowAttendance();
         },)
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'B Smart',
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
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Color(0xff006687)),
          primarySwatch: Colors.blue,
          accentIconTheme: IconThemeData(color: Color(0xff006687)),
          accentColor: Color(0xFFFFFFFF),
          focusColor: Color(0xFF8C98A8),
          hintColor: Color(0xFF44444f),
          backgroundColor: Color(0xff006687),
          scaffoldBackgroundColor: Colors.white,
          bottomAppBarTheme: BottomAppBarTheme(
            color: Color(0xFF41AED9),
          ),
          fontFamily: 'Tajawal',
        ),
        home: SplashScreen(),
      ),
    );
  }
}
