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

ActivateDto _$ActivateDtoFromJson(Map<String, dynamic> json) => ActivateDto(
      temporaryNumberId: json['temporaryNumberId'] as String,
    );

Map<String, dynamic> _$ActivateDtoToJson(ActivateDto instance) =>
    <String, dynamic>{
      'temporaryNumberId': instance.temporaryNumberId,
    };

DeactivateDto _$DeactivateDtoFromJson(Map<String, dynamic> json) =>
    DeactivateDto(
      temporaryNumberId: json['temporaryNumberId'] as String,
    );

Map<String, dynamic> _$DeactivateDtoToJson(DeactivateDto instance) =>
    <String, dynamic>{
      'temporaryNumberId': instance.temporaryNumberId,
    };

CreateIndividualConversationDto _$CreateIndividualConversationDtoFromJson(
        Map<String, dynamic> json) =>
    CreateIndividualConversationDto(
      userMobile: json['userMobile'] as String,
    );

Map<String, dynamic> _$CreateIndividualConversationDtoToJson(
        CreateIndividualConversationDto instance) =>
    <String, dynamic>{
      'userMobile': instance.userMobile,
    };
