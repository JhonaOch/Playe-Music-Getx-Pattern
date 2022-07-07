

import 'package:app_music_flutter/app/modules/home/home_binding.dart';
import 'package:app_music_flutter/app/modules/home/home_page.dart';
import 'package:app_music_flutter/app/modules/player/player_binding.dart';
import 'package:app_music_flutter/app/modules/player/player_page.dart';
import 'package:app_music_flutter/app/modules/splash/splash_binding.dart';
import 'package:app_music_flutter/app/modules/splash/splash_page.dart';
import 'package:app_music_flutter/app/modules/terms_service/terms_service_binding.dart';
import 'package:app_music_flutter/app/modules/terms_service/terms_service_page.dart';
import 'package:app_music_flutter/app/routes/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages{


  static final List<GetPage> pages =[

    GetPage(
      name: AppRoute.SPLASH, 
      page:()=> const SplashPage() ,
      binding:SplashBinding() ),

      GetPage(
      name: AppRoute.TERMS, 
      page:()=> const TermServicePage() ,
      binding:TermServiceBinding() ),

      GetPage(
      name: AppRoute.HOME, 
      page:()=> const HomePage() ,
      binding:HomeBinding() ),



      GetPage(
      name: AppRoute.PLAYER, 
      page:()=> const PlayerPage() ,
      binding:PlayerBinding() )


  ];
}