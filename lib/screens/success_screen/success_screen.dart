import 'package:flutter/material.dart';
import 'package:keley_app/config/AppFonts.dart';
import 'package:keley_app/providers/view_model_provider.dart';
import 'package:keley_app/extensions/string_extensions.dart';
import 'package:keley_app/screens/success_screen/success_screen_model.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SuccessScreenModel>(
      model: SuccessScreenModel(),
      onModelReady: (SuccessScreenModel model) {},
      builder: (SuccessScreenModel model) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            left: false,
            right: false,
            top: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                  EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 40),
                  child: Center(
                      child: Text(
                        'success_screen_header'.localized,
                        style: Appfonts.mainStyle(Colors.black, size: 32),
                        textAlign: TextAlign.center,
                      )),
                ),
                Image.asset('success_screen_placeholder.png'.imageAssetPath),
                SizedBox(height: 40,)
              ],
            ),
          ),
        );
      },
    );
  }

}
