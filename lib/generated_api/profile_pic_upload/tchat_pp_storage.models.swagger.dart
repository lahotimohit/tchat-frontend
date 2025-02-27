// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

part 'tchat_pp_storage.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfilePictureUploadPost$RequestBody {
  const ProfilePictureUploadPost$RequestBody({
    required this.file,
  });

  factory ProfilePictureUploadPost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ProfilePictureUploadPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ProfilePictureUploadPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ProfilePictureUploadPost$RequestBodyToJson(this);

  @JsonKey(name: 'file')
  final String file;
  static const fromJsonFactory = _$ProfilePictureUploadPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProfilePictureUploadPost$RequestBody &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(file) ^ runtimeType.hashCode;
}

extension $ProfilePictureUploadPost$RequestBodyExtension
    on ProfilePictureUploadPost$RequestBody {
  ProfilePictureUploadPost$RequestBody copyWith({String? file}) {
    return ProfilePictureUploadPost$RequestBody(file: file ?? this.file);
  }

  ProfilePictureUploadPost$RequestBody copyWithWrapped(
      {Wrapped<String>? file}) {
    return ProfilePictureUploadPost$RequestBody(
        file: (file != null ? file.value : this.file));
  }
}

@JsonSerializable(explicitToJson: true)
class ProfilePictureUploadPost$Response {
  const ProfilePictureUploadPost$Response({
    this.status,
    this.message,
    this.fileName,
  });

  factory ProfilePictureUploadPost$Response.fromJson(
          Map<String, dynamic> json) =>
      _$ProfilePictureUploadPost$ResponseFromJson(json);

  static const toJsonFactory = _$ProfilePictureUploadPost$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ProfilePictureUploadPost$ResponseToJson(this);

  @JsonKey(name: 'status')
  final double? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'fileName')
  final String? fileName;
  static const fromJsonFactory = _$ProfilePictureUploadPost$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProfilePictureUploadPost$Response &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(fileName) ^
      runtimeType.hashCode;
}

extension $ProfilePictureUploadPost$ResponseExtension
    on ProfilePictureUploadPost$Response {
  ProfilePictureUploadPost$Response copyWith(
      {double? status, String? message, String? fileName}) {
    return ProfilePictureUploadPost$Response(
        status: status ?? this.status,
        message: message ?? this.message,
        fileName: fileName ?? this.fileName);
  }

  ProfilePictureUploadPost$Response copyWithWrapped(
      {Wrapped<double?>? status,
      Wrapped<String?>? message,
      Wrapped<String?>? fileName}) {
    return ProfilePictureUploadPost$Response(
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        fileName: (fileName != null ? fileName.value : this.fileName));
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
