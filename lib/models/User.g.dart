// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    email: json['email'] as String?,
    name: json['name'] as String?,
    password: json['password'] as String?,
    babyBirthDate: json['babyBirthDate'] as String?,
    onBoardingDone: json['onBoardingDone'] as bool?,
    acceptedPrivacyPolicy: json['acceptedPrivacyPolicy'] as bool?,
    acceptedTermsAndConditions: json['acceptedTermsAndConditions'] as bool?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
      'babyBirthDate': instance.babyBirthDate,
      'onBoardingDone': instance.onBoardingDone,
      'acceptedPrivacyPolicy': instance.acceptedPrivacyPolicy,
      'acceptedTermsAndConditions': instance.acceptedTermsAndConditions,
    };
