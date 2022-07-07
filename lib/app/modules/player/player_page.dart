import 'package:app_music_flutter/app/modules/home/home_page.dart';
import 'package:app_music_flutter/app/modules/player/player_controller.dart';
import 'package:app_music_flutter/app/routes/app_routes.dart';
import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:app_music_flutter/app/utils/snackbart.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ThemesUI theme = ThemesUI();
    final Responsive responsive =Responsive(context);
    return Scaffold(
       appBar: AppBar(
        backgroundColor: theme.backgroundColor,),

      body: GetBuilder<PlayerControlller>(
        init: PlayerControlller(),
        builder: (_)=>
         SafeArea(
        
        
              
              child: Container(
                width:double.infinity,
          height: double.infinity,
          // color: theme.backgroundColor,
                decoration: 
                BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/imgs/fondo4.jpg'),
                    fit: BoxFit.cover,
                    
                  )
                ),
              
                
                child:
              
               Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 
                      
                   Center(
                    
                       child: Column(

                        
                        
                         children: [


                          SizedBox(
                            height: responsive.hp(3),
                          ),
                           CircleAvatar(
                            backgroundColor:theme.backgroundColor ,
                            radius: responsive.dp(13),
                           
                            child: Icon(Icons.music_note,
                            size: responsive.dp(10),),
                           ),
                         ],
                       ),
                     ),
                      
                     SizedBox(height: responsive.hp(3),),
                      
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: responsive.dp(2)),
                       child: Center(
                         child: Text(_.song!.title.toString(),
                         textAlign: TextAlign.center,
                         overflow: TextOverflow.fade
            
              ,style: GoogleFonts.acme(
                            fontSize: responsive.dp(3),
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                             ),),
                       ),
                     ),
                      
                         SizedBox(height:responsive.hp(1)),
                      
                         Center(
                           child: Text(_.song!.artist.toString()
              ,style: GoogleFonts.acme(
                        fontSize: responsive.dp(3),
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.normal,
                        color: theme.textColor,
                           ),),
                         ),
                      
                         SizedBox(height:responsive.hp(2)),
                      
                         Padding(
                           padding:  EdgeInsets.symmetric(vertical:responsive.wp(3),horizontal:responsive.wp(3)),
                           child: Row(
                            
                            children: [
                              Text(_.position.toString().split(".")[0]
              ,style: GoogleFonts.acme(
                        fontSize: responsive.dp(2),
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.normal,
                        color: theme.textColor,
                             ),),

                            
                              Expanded(child: Slider(
                                value: _.position.inSeconds.toDouble(),
                                min: const Duration(microseconds: 0).inSeconds.toDouble(),
                                max: _.duration.inSeconds.toDouble()+1,
                                onChanged: (value){
                                 final time= _.duration.inSeconds.toDouble()+1;
                                 print(value);
                                 print(time);
                                  if(value == time){
                                     _.next(context,_.player!,_.song!);
                                  }
                                  _.chagePositionSlider(value.toInt(), _.player!);
                                  value=value;
                              

                               

                                },
                      
                              )
                              
                              ),
                              Text(_.duration.toString().split(".")[0]
              ,style: GoogleFonts.acme(
                        fontSize: responsive.dp(2),
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.normal,
                        color: theme.textColor,
                             ),),
                              
                            ],
                      
                           ),
                         ),
                      
                        
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
                            children: [
                              IconButton(
                                onPressed: (){
                                 _.previus(context,_.player!,_.song!);
                              }, icon: Icon(Icons.skip_previous,color: theme.textColor,
                              size: responsive.hp(5),)),
                           
                              IconButton(onPressed: (){
                              
                                  if(_.validate == false){
                                    _.pause(_.player!);
                                   
                                  }else{
                                    
                                    _.play(_.player!);
                                       
                                     
                                  }
                                
                              
                              }, icon: 

                              _.validate 
                              != false
                              ?Icon(Icons.play_arrow,color: Colors.red,
                              size: responsive.hp(5),)
                              :Icon(Icons.pause,color: Color.fromARGB(255, 58, 204, 22),
                              size: responsive.hp(5),)),
                             
                              IconButton(onPressed: (){
                             

                                   _.next(context,_.player!,_.song!);

                               
                               
                              }, icon: Icon(Icons.skip_next,color: theme.textColor,
                              size: responsive.hp(5),)),
                           
                      
                            ],
                      
                      
                           
                         ),

                         SizedBox(height: responsive.hp(3),),
                      
                       
                       
                            Expanded(
                              child: Column(
                               // ignore: prefer_const_literals_to_create_immutables
                               children: [
                                
                                  //  CirculArvatar(
                                  //    child: Image.asset('assets/gifs/portada.gif',
                                  //    width: responsive.wp(100),
                                  //    height: responsive.hp(13.5),
                                  //    fit: BoxFit.cover,
                                     
                                     
                                  //    ),
                                   
                                   Center(
                                     child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: theme.backgroundColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(
                                          image: AssetImage('assets/gifs/portada.gif'),
                                          fit: BoxFit.cover,
                                          ),
                                      ),
                                     ),
                                   )
                                 
                               ],
                                                       ),
                            ),
                         
                      
                        
                   
                 ],
               )),
            ),
          ),
        
      
    );
  }
}