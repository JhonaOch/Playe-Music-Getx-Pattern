
import 'package:app_music_flutter/app/modules/terms_service/terms_service_controller.dart';
import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class TermServicePage extends StatelessWidget {
  const TermServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    final ThemesUI theme= ThemesUI();
    return GetBuilder<TermServiceController>(
      init:TermServiceController() ,
      builder: (_) => SafeArea(
        child: Scaffold(
          body: Container(
            width:double.infinity,
            height: double.infinity,
    
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imgs/fondo2.jpg'),
                fit:BoxFit.cover)
            ),
            
            child: Column(
    
              
              children: [
    
    
                SizedBox(height:50 ),
                // Image.asset('assets/imgs/music.jpg'),
                Text(
              'Terms of Service ',
              //textAlign: TextAlign.left,
             
              style: GoogleFonts.acme(
                  fontSize: responsive.dp(4),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: theme.textColor,
                   ),
            ),
    
            SizedBox(height:350 ),
    
               Container(
                height: 230,
                width: 350,
    
                decoration: BoxDecoration(
                  color: theme.backgroundColor.withOpacity(0.5),
                  
                  borderRadius: BorderRadius.circular(
                    20
                    )
                 
                ),
    
                //color:Color.fromARGB(255, 35, 0, 235),
    
                child: Column(
                  children: [
    
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
    
                         overflow: TextOverflow.fade,
                        'The app is governed by Star Music Terms Of service.\nBy continuing ro use this app you represent that you have read and accept the Terms of Service and Provacy Policy.', style: GoogleFonts.acme(
                  fontSize: responsive.dp(2),
                  //fontWeight: FontWeight.w700,
                  //fontStyle: FontStyle.normal,
                  color: theme.textColor),
            ),
                    ),
            //         Text('Para iniciar por favor a' ,style: GoogleFonts.acme(
            //       fontSize: responsive.dp(4),
            //       fontWeight: FontWeight.w700,
            //       fontStyle: FontStyle.normal,
            //       color: theme.textColor),
            // ),
                    ElevatedButton(
                      onPressed: _.aceptar, 
                      child:Text(
              'ACEPTAR Y CONTINUAR',
              style: GoogleFonts.acme(
                  fontSize: responsive.dp(2),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: theme.textColor),
            ),
                      style: ElevatedButton.styleFrom(
                        primary: theme.backgroundColor
    
                      ))
                  ],
                ),
    
    
               )
              ],
    
    
           
            ),
      
          )
        ),
      ),
    );
  }
}