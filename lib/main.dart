
import 'package:app_music_flutter/app/modules/splash/splash_binding.dart';
import 'package:app_music_flutter/app/modules/splash/splash_page.dart';
import 'package:app_music_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import 'package:get/get_navigation/get_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Material App',
      home: const SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      
     
        
      
    );
  }
}
