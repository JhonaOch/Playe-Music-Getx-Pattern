import 'package:app_music_flutter/app/modules/home/home_controller.dart';
import 'package:app_music_flutter/app/modules/player/player_page.dart';
import 'package:app_music_flutter/app/routes/app_routes.dart';
import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:app_music_flutter/app/utils/snackbart.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final Responsive responsive = Responsive(context);
    final ThemesUI theme= ThemesUI();
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,

        title: Text('Star Music'
        ,style: GoogleFonts.acme(
                  fontSize: responsive.dp(3),
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                   ),),
      

        actions: [
          IconButton(onPressed: (){
             Get.off(()=>
           HomePage(),
          transition: Transition.zoom,
          duration: Duration(seconds: 4)
        );
          }, icon:Icon( Icons.home)),
           IconButton(onPressed: (){}, icon:Icon( Icons.favorite)),
           
             IconButton(onPressed: (){}, icon:Icon( Icons.search))
        ],
        
      ),


      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_)=> Container(
          height: double.infinity,
          width: double.infinity,
          decoration: 
          BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imgs/fondo4.jpg'),
              fit: BoxFit.cover,
              
            )
          ),
          
      
          child:

          _.validator == 'false' ?
          Center(
            child: ElevatedButton(
              onPressed: _.checkPermissions, 
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 16, 25, 43)
              ),
              child: Text('Permisos')),
          ) 

          : ListView.separated(
            separatorBuilder: (context,index)=>Divider(), 
            itemCount: _.songs.length,
            itemBuilder:(context,index){
              if(_.songs.isNotEmpty){

                 return ListTile(
                  onTap: () async{

                    try{

                       await _.play(index);

                     await _.setAudio(_.songs[index].uri.toString());
                      

                    }catch (e) {
      print("Error loading audio source: $e");

      mostrarAwesonSnackbar(context, "Error :O", "The format music is not support.\n Automatic play the next song", ContentType.warning);
  Get.toNamed(AppRoute.PLAYER,arguments: _.songs[index+1]);
       await _.setAudio(_.songs[index+1].uri.toString());
        
                    }

                     
                    
                    // Navigator.pushNamed(context, AppRoute.PLAYER);

                  },
                  leading: CircleAvatar(
                    backgroundColor:theme.backgroundColor ,
                    child: Icon(Icons.music_note_rounded,
                    
                    ),
                  ),
                  title: Text(_.songs[index].title,
                  overflow: TextOverflow.visible,

                  style:TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                    

                  ) ,
                
                  ),
                  subtitle: Text(_.songs[index].artist.toString(),
                  style:TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                    

                  )
                  ),
                  trailing:  IconButton(
                    onPressed:(){
                      _.setAudio(_.songs[index].uri.toString());

                    },
                    icon: Icon(Icons.more_horiz,)
                    ),
                  
              
                    //_.setAudio(_.songs[index].uri.toString());
              
                  
                           
              
                

          //       onTap: (){
                 

          //         Get.off(
                    
          //           ()=>
                    
          //  PlayerPage(),
          // transition: Transition.zoom,
          // duration: Duration(seconds: 1)


          
          
          
          // );

          //  _.setAudio(_.songs[index].uri.toString());

                   

          //       },
              );
            

              }else{
                return Container();

              }
             
                   

              
          
            } ,)
        ),
      ),

    );
  }
}