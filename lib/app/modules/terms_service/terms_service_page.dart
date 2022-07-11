import 'package:app_music_flutter/app/modules/terms_service/terms_service_controller.dart';
import 'package:app_music_flutter/app/modules/terms_service/widgets/description_widgets.dart';
import 'package:app_music_flutter/app/modules/terms_service/widgets/logo_widgets.dart';
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
    final ThemesUI theme = ThemesUI();

    return GetBuilder<TermServiceController>(
        init: TermServiceController(),
        builder: (controller) => SafeArea(
              child: Scaffold(
                  body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/imgs/fondo2.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SizedBox(height: responsive.hp(3)),
                    const LogoWidget(),
                    SizedBox(height: responsive.hp(40)),
                    const DescriptionWidget(),
                    ElevatedButton(
                        onPressed: controller.aceptar,
                        style: ElevatedButton.styleFrom(
                            primary: theme.backgroundColor),
                        child: Text(
                          'ACEPTAR Y CONTINUAR',
                          style: GoogleFonts.acme(
                              fontSize: responsive.dp(2),
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: theme.textColor),
                        ))
                  ],
                ),
              )),
            ));
  }
}
