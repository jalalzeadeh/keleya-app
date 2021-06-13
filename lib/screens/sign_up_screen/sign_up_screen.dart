import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keley_app/config/AppColors.dart';
import 'package:keley_app/config/AppFonts.dart';
import 'package:keley_app/providers/view_model_provider.dart';
import 'package:keley_app/routing/routings_constants.dart';
import 'package:keley_app/extensions/string_extensions.dart';
import 'package:keley_app/screens/sign_up_screen/sign_up_screen_model.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SignUpScreen extends StatelessWidget {

  bool isFinishedAnimation = true;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpScreenModel>(
      model: SignUpScreenModel(),/// set model first
      onModelReady: (SignUpScreenModel model) {
        /// this called before drow layout
      },
      builder: (SignUpScreenModel model) {
        return KeyboardDismissOnTap(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.mainColor,
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: KeyboardVisibilityController().isVisible ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
              child: SafeArea(
                bottom: false,
                left: false,
                right: false,
                top: false,
                child: Column(
                  children: [
                KeyboardVisibilityBuilder(builder: (context, visible){
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
                      height: visible ? 0 : 230,
                child: IgnorePointer(
                  // ignoring: !isFinishedAnimation ? false : visible ? false: true,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: !isFinishedAnimation ? 0 : visible ? 0: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Center(
                        child: Text(
                          'register_screen_header'.localized,
                          style: Appfonts.mainStyle(Colors.white, size: 36 ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              );}),
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
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(left: 40, right: 40, top: 40),
                                child: Text(
                                  'register_screen_title'.localized,
                                  style: Appfonts.mainStyle(Colors.black, size: 24),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              _buildEmailField(model),
                              _buildPasswordField(model),
                              _buildConfirmPasswordField(model),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (model.canSendData()) {
                                    final success = await model.registerUser();
                                    if (success) {
                                      Navigator.pushNamed(
                                          context, RoutingConstants.LoginViewRoute);
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
                                  margin: EdgeInsets.only(left: 16, right: 16),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: AppColors.mainColor,
                                  ),
                                  child: Center(
                                    child: model.isBusy ?
                                    CircularProgressIndicator(color: Colors.white,)
                                        : Text(
                                      'register_screen_create_account_button'
                                          .localized,
                                      style: Appfonts.mainStyle(AppColors.whitColor,
                                          size: 18),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              _buildFooterSection(context, model),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ),
            ),
          ),
        );
      },
    );
  }

  /// build email text field
  Widget _buildEmailField(SignUpScreenModel model) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      padding: EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppColors.greyLightColor)),
      child: TextField(
        enableSuggestions: false,
        autocorrect: false,
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


  /// build password field
  Widget _buildPasswordField(SignUpScreenModel model) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      padding: EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
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

  /// build confirm password field
  Widget _buildConfirmPasswordField(SignUpScreenModel model) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      padding: EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppColors.greyLightColor)),
      child: TextField(
        enableSuggestions: false,
        autocorrect: false,
        obscureText: !model.showConfirmPassword,
        onChanged: (String newValue) {
          model.confirmPassword = newValue;
        },
        decoration: new InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              model.changeConfirmPasswordType();
            },
            child: Container(
              width: 10,
              height: 10,
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: SvgPicture.asset(
                model.showConfirmPassword
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

  /// build fotter section: accept terms & accept privacy & register button
  Widget _buildFooterSection(BuildContext context, SignUpScreenModel model) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: () {
                model.togglePolicyType();
              },
              child: Image.asset(
                model.acceptedPolicy
                    ? 'checkbox_selected.png'.imageAssetPath
                    : 'checkbox_unselect.png'.imageAssetPath,
                width: 20,
                height: 20,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text('register_screen_accept'.localized,
                style: Appfonts.mainStyle(AppColors.greyDark, size: 16)),
            SizedBox(
              width: 4,
            ),
            GestureDetector(
                onTap: () {},
                child: Text(
                  'register_screen_privacy'.localized,
                  style: Appfonts.mainStyle(AppColors.mainColor, size: 16),
                ))
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: () {
                model.toggleTermsType();
              },
              child: Image.asset(
                model.acceptedTersm
                    ? 'checkbox_selected.png'.imageAssetPath
                    : 'checkbox_unselect.png'.imageAssetPath,
                width: 20,
                height: 20,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'register_screen_accept'.localized,
                      style: Appfonts.mainStyle(AppColors.greyDark, size: 16)),
                  TextSpan(text: ' '),
                  TextSpan(
                      text: 'register_screen_terms'.localized,
                      style: Appfonts.mainStyle(AppColors.mainColor, size: 16)),
                  TextSpan(
                      text: ' & ',
                      style: Appfonts.mainStyle(Colors.black, size: 16)),
                  TextSpan(
                      text: 'register_screen_advice'.localized,
                      style: Appfonts.mainStyle(AppColors.mainColor, size: 16))
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutingConstants.LoginViewRoute);
              },
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'register_screen_have_account'.localized,
                      style: Appfonts.mainStyle(Colors.black, size: 19)),
                  TextSpan(text: '    '),
                  TextSpan(
                      text: 'register_screen_sing_in'.localized,
                      style: Appfonts.mainStyle(AppColors.mainColor,
                          weight: FontWeight.bold, size: 19)),
                ]),
              ),
            )
          ],
        )
      ],
    );
  }
}
