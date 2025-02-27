// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tchat_pp_storage.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePictureUploadPost$RequestBody
    _$ProfilePictureUploadPost$RequestBodyFromJson(Map<String, dynamic> json) =>
        ProfilePictureUploadPost$RequestBody(
          file: json['file'] as String,
        );

Map<String, dynamic> _$ProfilePictureUploadPost$RequestBodyToJson(
        ProfilePictureUploadPost$RequestBody instance) =>
    <String, dynamic>{
      'file': instance.file,
    };

ProfilePictureUploadPost$Response _$ProfilePictureUploadPost$ResponseFromJson(
        Map<String, dynamic> json) =>
    ProfilePictureUploadPost$Response(
      status: (json['status'] as num?)?.toDouble(),
      message: json['message'] as String?,
      fileName: json['fileName'] as String?,
    );

Map<String, dynamic> _$ProfilePictureUploadPost$ResponseToJson(
        ProfilePictureUploadPost$Response instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'fileName': instance.fileName,
    };
