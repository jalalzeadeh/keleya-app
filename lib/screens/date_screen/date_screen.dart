import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:keley_app/config/AppColors.dart';
import 'package:keley_app/config/AppFonts.dart';
import 'package:keley_app/extensions/date_helper.dart';
import 'package:keley_app/providers/view_model_provider.dart';
import 'package:keley_app/routing/routings_constants.dart';
import 'package:keley_app/screens/date_screen/date_screen_model.dart';
import 'package:keley_app/extensions/string_extensions.dart';
import 'package:table_calendar/table_calendar.dart';

class DateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<DateScreenModel>(
      model: DateScreenModel(),
      onModelReady: (DateScreenModel model) {},
      builder: (DateScreenModel model) {
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
                child: Stack(
                  children: [
                    Column(
                      children: [
                        _buildNavigationBar(context),
                        Container(
                          padding: EdgeInsets.only(
                              left: 30, right: 30, top: 40, bottom: 40),
                          child: Center(
                              child: Text(
                            'date_screen_header'.localized,
                            style: Appfonts.mainStyle(Colors.black, size: 36),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 20, bottom: 20),
                          child: Center(
                              child: Text(
                            'date_screen_description'.localized,
                            style: Appfonts.mainStyle(AppColors.greyDark,
                                size: 20),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        _buildEmailField(model),
                        Spacer(),
                        _buildNextButton(context),
                        SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                    /// calendar overlay view
                    _buildCalendar(model),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// build name text field
  Widget _buildEmailField(DateScreenModel model) {
    return GestureDetector(
      onTap: () {
        model.toggleCalendar();
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: AppColors.greyLightColor)),
              child: Text(DateHelper.getDayBornFormat(model.selectedDay)),
            ),
          ),
        ],
      ),
    );
  }

  /// build calendar overlay
  Widget _buildCalendar(DateScreenModel model) {
    return Visibility(
      visible: model.showCaleendar,
      child: GestureDetector(
        onTap: () {
          model.toggleCalendar();
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          color: Colors.black.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                /// calendar component view
                child: TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: model.selectedDay,
                  calendarStyle: CalendarStyle(
                      selectedTextStyle:
                      TextStyle(color: Colors.white),
                      selectedDecoration: BoxDecoration(
                          color: AppColors.mainColor)),
                  onFormatChanged: (format) {},
                  onDaySelected: (selectedDay, focusDay) {
                    model.upDateSelectedDate(selectedDay);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  /// build next button
  Widget _buildNextButton(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context, RoutingConstants.SuccessViewRoute);
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
            style: Appfonts.mainStyle(AppColors.whitColor,
                size: 16),
          ),
        ),
      ),
    );
  }


  /// build navigation bar with
  Widget _buildNavigationBar(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'left_arrow.png'.imageAssetPath,
              height: 26,
              width: 26,
            ),
          ),
        )
      ],
    );
  }

}
