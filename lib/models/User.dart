import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  int id;
  String? email;
  String? name;
  String? password;
  String? babyBirthDate;
  bool? onBoardingDone;
  bool? acceptedPrivacyPolicy;
  bool? acceptedTermsAndConditions;

  User(
      {this.id = 0,
      this.email,
      this.name,
      this.password,
      this.babyBirthDate,
      this.onBoardingDone,
      this.acceptedPrivacyPolicy,
      this.acceptedTermsAndConditions});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
