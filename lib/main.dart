import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday_assignment/screens/main_wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ), // Ends SystemUiOverlayStyle constructor
  ); // Ends setSystemUIOverlayStyle function AND adds the semicolon

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Portfolio Student',
          theme: ThemeData(
            // primarySwatch: Colors.deepOrange,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Roboto',
            useMaterial3: true,
          ),
          home: const MainWrapper(),
        );
      },
    );
  }
}