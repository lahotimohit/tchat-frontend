// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

part 'tchat.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginDto {
  const LoginDto({
    required this.email,
    required this.defaultMobileNumber,
    required this.countryCode,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  static const toJsonFactory = _$LoginDtoToJson;
  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'defaultMobileNumber')
  final String defaultMobileNumber;
  @JsonKey(name: 'countryCode')
  final int countryCode;
  static const fromJsonFactory = _$LoginDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LoginDto &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.defaultMobileNumber, defaultMobileNumber) ||
                const DeepCollectionEquality()
                    .equals(other.defaultMobileNumber, defaultMobileNumber)) &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(defaultMobileNumber) ^
      const DeepCollectionEquality().hash(countryCode) ^
      runtimeType.hashCode;
}

extension $LoginDtoExtension on LoginDto {
  LoginDto copyWith(
      {String? email, String? defaultMobileNumber, int? countryCode}) {
    return LoginDto(
        email: email ?? this.email,
        defaultMobileNumber: defaultMobileNumber ?? this.defaultMobileNumber,
        countryCode: countryCode ?? this.countryCode);
  }

  LoginDto copyWithWrapped(
      {Wrapped<String>? email,
      Wrapped<String>? defaultMobileNumber,
      Wrapped<int>? countryCode}) {
    return LoginDto(
        email: (email != null ? email.value : this.email),
        defaultMobileNumber: (defaultMobileNumber != null
            ? defaultMobileNumber.value
            : this.defaultMobileNumber),
        countryCode:
            (countryCode != null ? countryCode.value : this.countryCode));
  }
}

@JsonSerializable(explicitToJson: true)
class RegisterDto {
  const RegisterDto({
    required this.name,
    required this.about,
    this.profilePictureUrl,
  });

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);

  static const toJsonFactory = _$RegisterDtoToJson;
  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'about')
  final String about;
  @JsonKey(name: 'profile_picture_url')
  final String? profilePictureUrl;
  static const fromJsonFactory = _$RegisterDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is RegisterDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.about, about) ||
                const DeepCollectionEquality().equals(other.about, about)) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                const DeepCollectionEquality()
                    .equals(other.profilePictureUrl, profilePictureUrl)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(about) ^
      const DeepCollectionEquality().hash(profilePictureUrl) ^
      runtimeType.hashCode;
}

extension $RegisterDtoExtension on RegisterDto {
  RegisterDto copyWith(
      {String? name, String? about, String? profilePictureUrl}) {
    return RegisterDto(
        name: name ?? this.name,
        about: about ?? this.about,
        profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl);
  }

  RegisterDto copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<String>? about,
      Wrapped<String?>? profilePictureUrl}) {
    return RegisterDto(
        name: (name != null ? name.value : this.name),
        about: (about != null ? about.value : this.about),
        profilePictureUrl: (profilePictureUrl != null
            ? profilePictureUrl.value
            : this.profilePictureUrl));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateProfileDto {
  const UpdateProfileDto({
    required this.name,
    required this.about,
    this.profilePictureUrl,
  });

  factory UpdateProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileDtoFromJson(json);

  static const toJsonFactory = _$UpdateProfileDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateProfileDtoToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'about')
  final String about;
  @JsonKey(name: 'profile_picture_url')
  final String? profilePictureUrl;
  static const fromJsonFactory = _$UpdateProfileDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UpdateProfileDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.about, about) ||
                const DeepCollectionEquality().equals(other.about, about)) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                const DeepCollectionEquality()
                    .equals(other.profilePictureUrl, profilePictureUrl)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(about) ^
      const DeepCollectionEquality().hash(profilePictureUrl) ^
      runtimeType.hashCode;
}

extension $UpdateProfileDtoExtension on UpdateProfileDto {
  UpdateProfileDto copyWith(
      {String? name, String? about, String? profilePictureUrl}) {
    return UpdateProfileDto(
        name: name ?? this.name,
        about: about ?? this.about,
        profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl);
  }

  UpdateProfileDto copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<String>? about,
      Wrapped<String?>? profilePictureUrl}) {
    return UpdateProfileDto(
        name: (name != null ? name.value : this.name),
        about: (about != null ? about.value : this.about),
        profilePictureUrl: (profilePictureUrl != null
            ? profilePictureUrl.value
            : this.profilePictureUrl));
  }
}

@JsonSerializable(explicitToJson: true)
class VerifyOtpDto {
  const VerifyOtpDto({
    required this.otp,
  });

  factory VerifyOtpDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpDtoFromJson(json);

  static const toJsonFactory = _$VerifyOtpDtoToJson;
  Map<String, dynamic> toJson() => _$VerifyOtpDtoToJson(this);

  @JsonKey(name: 'otp')
  final String otp;
  static const fromJsonFactory = _$VerifyOtpDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VerifyOtpDto &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(otp) ^ runtimeType.hashCode;
}

extension $VerifyOtpDtoExtension on VerifyOtpDto {
  VerifyOtpDto copyWith({String? otp}) {
    return VerifyOtpDto(otp: otp ?? this.otp);
  }

  VerifyOtpDto copyWithWrapped({Wrapped<String>? otp}) {
    return VerifyOtpDto(otp: (otp != null ? otp.value : this.otp));
  }
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
