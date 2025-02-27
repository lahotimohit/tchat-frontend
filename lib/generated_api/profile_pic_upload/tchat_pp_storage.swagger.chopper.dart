// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tchat_pp_storage.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$TchatPpStorage extends TchatPpStorage {
  _$TchatPpStorage([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = TchatPpStorage;

  @override
  Future<Response<dynamic>> _imagesUploadPost() {
    final Uri $url = Uri.parse('/images/upload');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ProfilePictureUploadPost$Response>>
      _profilePictureUploadPost({
    String? authorization,
    required http.MultipartFile file,
  }) {
    final Uri $url = Uri.parse('/profile-picture/upload');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<http.MultipartFile>(
        'file',
        file,
      )
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
    );
    return client.send<ProfilePictureUploadPost$Response,
        ProfilePictureUploadPost$Response>($request);
  }

  @override
  Future<Response<dynamic>> _get() {
    final Uri $url = Uri.parse('/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
