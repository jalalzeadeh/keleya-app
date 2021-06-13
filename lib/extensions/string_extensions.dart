import 'package:keley_app/localization/app_localizations.dart';


extension StringExtension on String{
  get firstLetterToUpperCase {
    return this[0].toUpperCase() + this.substring(1);
  }

  get localized => AppLocalizations.instance.translate(this) ?? this;

  String get imageAssetPath => this.isEmpty ? "" : "res/images/$this";

  get isEmail => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);





}