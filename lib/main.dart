import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_classifiedappclone/Constants/constants.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/splash_screen.dart';
import 'package:flutter_classifiedappclone/UI/main_ui.dart';
import 'package:flutter_classifiedappclone/UI/hotel_booking/hotel_home_screen.dart';
import 'package:flutter_classifiedappclone/UI/hotel_booking/hotel_info_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(

      debugShowCheckedModeBanner: true,
      title: 'MeeDo ',
      theme: ThemeData(primaryColor: DesignCourseAppTheme.orange),
      routes: <String, WidgetBuilder>{
        MAIN_UI: (BuildContext context) => MainUI(),
        SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
        HOUSE_SCREEN: (BuildContext context) => HotelHomeScreen(),
        HOUSE_DETAIL: (BuildContext context) => HouseInfoScreen(),

      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}
