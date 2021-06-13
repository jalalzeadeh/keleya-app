import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:keley_app/config/AppColors.dart';
import 'package:keley_app/config/AppFonts.dart';
import 'package:keley_app/providers/view_model_provider.dart';
import 'package:keley_app/routing/routings_constants.dart';
import 'package:keley_app/extensions/string_extensions.dart';
import 'package:keley_app/screens/name_screen/name_screen_model.dart';

class NameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<NameScreenModel>(
      model: NameScreenModel(),
      onModelReady: (NameScreenModel model) {},
      builder: (NameScreenModel model) {
        return KeyboardDismissOnTap(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
          //  backgroundColor: AppColors.mainColor,
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark,
              child: SafeArea(
                bottom: false,
                left: false,
                right: false,
                top: true,
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset('left_arrow.png'.imageAssetPath, height: 26, width: 26,),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding:
                      EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 40),
                      child: Center(
                          child: Text(
                            'name_screen_header'.localized,
                            style: Appfonts.mainStyle(Colors.black, size: 36),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    _buildEmailField(model),
                    Spacer(),
                    GestureDetector(
                      onTap: () async {
                        if (model.name.isEmpty) {
                          final success = await model.updateUser();
                          if (success) {
                            Navigator.pushNamed(
                                context, RoutingConstants.DateViewRoute);
                          }
                        }
                      },
                      child: Container(
                        height: 60,
                        margin: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          child: Text(
                            'name_screen_next_button'.localized,
                            style: Appfonts.mainStyle(AppColors.whitColor, size: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmailField(NameScreenModel model) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppColors.greyLightColor)),
      child: TextField(
        enableSuggestions: false,
        autocorrect: false,
        onChanged: (String newValue) {
          model.name = newValue;
        },
        decoration: new InputDecoration(
          border: InputBorder.none,
          labelStyle: TextStyle(color: AppColors.greyPlaceHolderColor),
          //hintText: 'user_name_hint'.localized,
          hintText: 'name_screen_name_placeholder'.localized,
        ),
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
