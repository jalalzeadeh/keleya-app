import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keley_app/config/AppColors.dart';
import 'package:keley_app/config/AppFonts.dart';
import 'package:keley_app/providers/view_model_provider.dart';
import 'package:keley_app/routing/routings_constants.dart';
import 'package:keley_app/screens/init_screen/initial_screen_model.dart';
import 'package:keley_app/extensions/string_extensions.dart';

class InitialScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<InitialScreenModel>(
      model: InitialScreenModel(),
      onModelReady: (InitialScreenModel model) {
        /// this called before drow layout
      },
      builder: (InitialScreenModel model) {
        return Scaffold(
          backgroundColor: AppColors.mainColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: SafeArea(
              bottom: false,
              left: false,
              right: false,
              top: true,
              child: Column(
                children: [
                  _buildHeader(),
                  /// build white section
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whitColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero,
                        ),
                      ),
                      child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /// Login button
                              _buildLoginButton(context),
                              SizedBox(
                                height: 40,
                              ),
                              /// register button
                              _buildCreateButton(context),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// header move section
  Widget _buildHeader(){
    return Container(
      padding: EdgeInsets.only(
          left: 30, right: 30, top: 40, bottom: 40),
      child: Text(
        'init_screen_header'.localized,
        style: Appfonts.mainStyle(
          AppColors.whitColor,
          size: 36,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// build login button
  Widget _buildLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context, RoutingConstants.LoginViewRoute);
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
            'init_screen_login_button'.localized,
            style: Appfonts.mainStyle(
              AppColors.whitColor,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }

  /// build register button
  Widget _buildCreateButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,
            RoutingConstants.SignUPViewRoute);
      },
      child: Container(
        height: 60,
        margin: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(8)),
          color: AppColors.secondColor,
        ),
        child: Center(
          child: Text(
            'init_screen_create_account'.localized,
            style: Appfonts.mainStyle(
              AppColors.mainColor,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
