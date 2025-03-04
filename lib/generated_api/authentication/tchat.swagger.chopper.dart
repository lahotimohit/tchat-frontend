// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tchat.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$Tchat extends Tchat {
  _$Tchat([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = Tchat;

  @override
  Future<Response<dynamic>> _authLoginPost({required LoginDto? body}) {
    final Uri $url = Uri.parse('/auth/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _authRegisterPost({
    String? authorization,
    String? refresh,
    required RegisterDto? body,
  }) {
    final Uri $url = Uri.parse('/auth/register');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
      if (refresh != null) 'refresh': refresh,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _authProfileUpdatePut({
    String? refresh,
    String? authorization,
    required UpdateProfileDto? body,
  }) {
    final Uri $url = Uri.parse('/auth/profile/update');
    final Map<String, String> $headers = {
      if (refresh != null) 'refresh': refresh,
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _authSessionGet({String? authorization}) {
    final Uri $url = Uri.parse('/auth/session');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _authLogoutGet({
    String? authorization,
    String? refresh,
  }) {
    final Uri $url = Uri.parse('/auth/logout');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
      if (refresh != null) 'refresh': refresh,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _authGetAccessTokenGet({String? refresh}) {
    final Uri $url = Uri.parse('/auth/get-access-token');
    final Map<String, String> $headers = {
      if (refresh != null) 'refresh': refresh,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _authVerifyOtpPost({
    required Object? otpToken,
    required VerifyOtpDto? body,
  }) {
    final Uri $url = Uri.parse('/auth/verify-otp');
    final Map<String, dynamic> $params = <String, dynamic>{
      'otpToken': otpToken
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _tnumMintPost({String? authorization}) {
    final Uri $url = Uri.parse('/tnum/mint');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _tnumListPost({String? authorization}) {
    final Uri $url = Uri.parse('/tnum/list');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _tnumActivatePost({
    String? authorization,
    required ActivateDto? body,
  }) {
    final Uri $url = Uri.parse('/tnum/activate');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _tnumDeactivatePost({
    String? authorization,
    required DeactivateDto? body,
  }) {
    final Uri $url = Uri.parse('/tnum/deactivate');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
