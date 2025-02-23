// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tchat.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      email: json['email'] as String,
      defaultMobileNumber: json['defaultMobileNumber'] as String,
      countryCode: (json['countryCode'] as num).toInt(),
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      'email': instance.email,
      'defaultMobileNumber': instance.defaultMobileNumber,
      'countryCode': instance.countryCode,
    };

RegisterDto _$RegisterDtoFromJson(Map<String, dynamic> json) => RegisterDto(
      name: json['name'] as String,
      about: json['about'] as String,
      profilePictureUrl: json['profile_picture_url'] as String?,
    );

Map<String, dynamic> _$RegisterDtoToJson(RegisterDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'about': instance.about,
      'profile_picture_url': instance.profilePictureUrl,
    };

UpdateProfileDto _$UpdateProfileDtoFromJson(Map<String, dynamic> json) =>
    UpdateProfileDto(
      name: json['name'] as String,
      about: json['about'] as String,
      profilePictureUrl: json['profile_picture_url'] as String?,
    );

Map<String, dynamic> _$UpdateProfileDtoToJson(UpdateProfileDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'about': instance.about,
      'profile_picture_url': instance.profilePictureUrl,
    };

VerifyOtpDto _$VerifyOtpDtoFromJson(Map<String, dynamic> json) => VerifyOtpDto(
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifyOtpDtoToJson(VerifyOtpDto instance) =>
    <String, dynamic>{
      'otp': instance.otp,
    };
