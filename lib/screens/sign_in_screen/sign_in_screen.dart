import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keley_app/config/AppColors.dart';
import 'package:keley_app/config/AppFonts.dart';
import 'package:keley_app/providers/view_model_provider.dart';
import 'package:keley_app/routing/routings_constants.dart';
import 'package:keley_app/extensions/string_extensions.dart';
import 'package:keley_app/screens/sign_in_screen/sign_in_screen_model.dart';

class SignInScreen extends StatelessWidget {
  bool isFinishedAnimation = true;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignInScreenModel>(
      model: SignInScreenModel(),
      onModelReady: (SignInScreenModel model) {},
      builder: (SignInScreenModel model) {
        /// use keyboard dismiss to dismiss keyboard after user
        ///   tap inside any point in screen
        return KeyboardDismissOnTap(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.mainColor,
            /// This for change status bar color when visible keyboard
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: KeyboardVisibilityController().isVisible
                  ? SystemUiOverlayStyle.dark
                  : SystemUiOverlayStyle.light,
              child: SafeArea(
                bottom: false,
                left: false,
                right: false,
                top: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /// listener for keyboard visibility
                    KeyboardVisibilityBuilder(builder: (context, visible) {
                      if (visible) {
                        isFinishedAnimation = false;
                      }
                      return AnimatedContainer(
                        onEnd: () {
                          isFinishedAnimation = true;
                          model.notifyListeners();
                        },
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(milliseconds: 600),
                        margin: EdgeInsets.all(0),
                        height: visible ? 0 : 230,
                        child: IgnorePointer(
                          // ignoring: !isFinishedAnimation ? false : visible ? false: true,
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 200),
                            opacity: !isFinishedAnimation
                                ? 0
                                : visible
                                    ? 0
                                    : 1,
                            child: Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Center(
                                child: Text(
                                  'login_screen_header'.localized,
                                  style: Appfonts.mainStyle(Colors.white,
                                      size: 36),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    Expanded(
                      child: KeyboardVisibilityBuilder(
                          builder: (context, visible) {
                        return AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: AppColors.whitColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(visible ? 0 : 40),
                                topLeft: Radius.circular(visible ? 0 : 40),
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.zero,
                              ),
                            ),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 40, right: 40, top: 80),
                                    child: Text(
                                      'login_screen_title'.localized,
                                      style: Appfonts.mainStyle(Colors.black,
                                          size: 24),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  _buildEmailField(model),
                                  _buildPasswordField(model),
                                  /// I Used 'forgot password' to close screen cuz the designer didn't use back button
                                  _buildForgotPassword(context),
                                  Spacer(),
                                  _buildNextButton(context, model),
                                  SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            ));
                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// build email text field
  Widget _buildEmailField(SignInScreenModel model) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppColors.greyLightColor)),
      child: TextField(
        enableSuggestions: false,
        autocorrect: false,
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        onChanged: (String newValue) {
          model.email = newValue;
        },
        decoration: new InputDecoration(
          border: InputBorder.none,
          labelStyle: TextStyle(color: AppColors.greyPlaceHolderColor),
          //hintText: 'user_name_hint'.localized,
          labelText: 'login_screen_email_place_holder'.localized,
        ),
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  /// build password text field
  Widget _buildPasswordField(SignInScreenModel model) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppColors.greyLightColor)),
      child: TextField(
        enableSuggestions: false,
        autocorrect: false,
        obscureText: !model.showPassword,
        onChanged: (String newValue) {
          model.password = newValue;
        },
        decoration: new InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              model.changePasswordType();
            },
            child: Container(
              width: 10,
              height: 10,
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: SvgPicture.asset(
                model.showPassword
                    ? "password_show.svg".imageAssetPath
                    : "password_hidden.svg".imageAssetPath,
                color: AppColors.greyPlaceHolderColor,
              ),
            ),
          ),
          border: InputBorder.none,
          labelStyle: TextStyle(color: AppColors.greyPlaceHolderColor),
          //hintText: 'user_name_hint'.localized,
          labelText: 'login_screen_email_password_holder'.localized,
        ),
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  /// build forgot button
  Widget _buildForgotPassword(BuildContext context) {
    return Row(
      children: [
        Spacer(),

        /// I Used 'forgot password' to close screen cuz designer didn't use back button
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            child: Text('login_screen_forgot_password'.localized,
                style: Appfonts.mainStyle(AppColors.mainColor, size: 18)),
            margin: EdgeInsets.only(right: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildNextButton(BuildContext context, SignInScreenModel model) {
    return GestureDetector(
      onTap: () async {
        if (model.canSendData()) {
          final success =
          await model.checkLogin();
          if (success) {
            Navigator.pushNamed(context,
                RoutingConstants.NameViewRoute);
          }
        } else {
          Fluttertoast.showToast(
            msg: "login_error_message".localized,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      child: Container(
        height: 60,
        margin:
        EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(8)),
          color: AppColors.mainColor,
        ),
        child: Center(
          child: model.isBusy
              ? CircularProgressIndicator(
            color: Colors.white,
          )
              : Text(
            'login_screen_sign_button'
                .localized,
            style: Appfonts.mainStyle(
                AppColors.whitColor,
                size: 16),
          ),
        ),
      ),
    );
  }


}
