// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import 'tchat.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
export 'tchat.models.swagger.dart';

part 'tchat.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Tchat extends ChopperService {
  static Tchat create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$Tchat(client);
    }

    final newClient = ChopperClient(
        services: [_$Tchat()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Tchat(newClient);
  }

  ///User login
  Future<chopper.Response> authLoginPost({required LoginDto? body}) {
    return _authLoginPost(body: body);
  }

  ///User login
  @Post(
    path: '/auth/login',
    optionalBody: true,
  )
  Future<chopper.Response> _authLoginPost({@Body() required LoginDto? body});

  ///User registration
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  ///@param refresh Refresh token
  Future<chopper.Response> authRegisterPost({
    String? authorization,
    String? refresh,
    required RegisterDto? body,
  }) {
    return _authRegisterPost(
        authorization: authorization?.toString(),
        refresh: refresh?.toString(),
        body: body);
  }

  ///User registration
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  ///@param refresh Refresh token
  @Post(
    path: '/auth/register',
    optionalBody: true,
  )
  Future<chopper.Response> _authRegisterPost({
    @Header('Authorization') String? authorization,
    @Header('refresh') String? refresh,
    @Body() required RegisterDto? body,
  });

  ///Update user profile
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  ///@param refresh Refresh token
  Future<chopper.Response> authProfileUpdatePut({
    String? authorization,
    String? refresh,
    required UpdateProfileDto? body,
  }) {
    return _authProfileUpdatePut(
        authorization: authorization?.toString(),
        refresh: refresh?.toString(),
        body: body);
  }

  ///Update user profile
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  ///@param refresh Refresh token
  @Put(
    path: '/auth/profile/update',
    optionalBody: true,
  )
  Future<chopper.Response> _authProfileUpdatePut({
    @Header('Authorization') String? authorization,
    @Header('refresh') String? refresh,
    @Body() required UpdateProfileDto? body,
  });

  ///Get session info
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  Future<chopper.Response> authSessionGet({String? authorization}) {
    return _authSessionGet(authorization: authorization?.toString());
  }

  ///Get session info
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  @Get(path: '/auth/session')
  Future<chopper.Response> _authSessionGet(
      {@Header('Authorization') String? authorization});

  ///User logout
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  ///@param refresh Refresh token
  Future<chopper.Response> authLogoutGet({
    String? authorization,
    String? refresh,
  }) {
    return _authLogoutGet(
        authorization: authorization?.toString(), refresh: refresh?.toString());
  }

  ///User logout
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  ///@param refresh Refresh token
  @Get(path: '/auth/logout')
  Future<chopper.Response> _authLogoutGet({
    @Header('Authorization') String? authorization,
    @Header('refresh') String? refresh,
  });

  ///Get new access token
  ///@param refresh Refresh token
  Future<chopper.Response> authGetAccessTokenGet({String? refresh}) {
    return _authGetAccessTokenGet(refresh: refresh?.toString());
  }

  ///Get new access token
  ///@param refresh Refresh token
  @Get(path: '/auth/get-access-token')
  Future<chopper.Response> _authGetAccessTokenGet(
      {@Header('refresh') String? refresh});

  ///Verify OTP
  ///@param otpToken Token received for OTP verification
  Future<chopper.Response> authVerifyOtpPost({
    required Object? otpToken,
    required VerifyOtpDto? body,
  }) {
    return _authVerifyOtpPost(otpToken: otpToken, body: body);
  }

  ///Verify OTP
  ///@param otpToken Token received for OTP verification
  @Post(
    path: '/auth/verify-otp',
    optionalBody: true,
  )
  Future<chopper.Response> _authVerifyOtpPost({
    @Query('otpToken') required Object? otpToken,
    @Body() required VerifyOtpDto? body,
  });

  ///Resend OTP
  ///@param otpToken Token received for OTP verification
  Future<chopper.Response> authResendOtpPost({required Object? otpToken}) {
    return _authResendOtpPost(otpToken: otpToken);
  }

  ///Resend OTP
  ///@param otpToken Token received for OTP verification
  @Post(
    path: '/auth/resend-otp',
    optionalBody: true,
  )
  Future<chopper.Response> _authResendOtpPost(
      {@Query('otpToken') required Object? otpToken});

  ///Get Profile
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  Future<chopper.Response> authProfileGet({String? authorization}) {
    return _authProfileGet(authorization: authorization?.toString());
  }

  ///Get Profile
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  @Get(path: '/auth/profile')
  Future<chopper.Response> _authProfileGet(
      {@Header('Authorization') String? authorization});

  ///Create a new temporary number
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  Future<chopper.Response> tnumMintPost({String? authorization}) {
    return _tnumMintPost(authorization: authorization?.toString());
  }

  ///Create a new temporary number
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  @Post(
    path: '/tnum/mint',
    optionalBody: true,
  )
  Future<chopper.Response> _tnumMintPost(
      {@Header('Authorization') String? authorization});

  ///List all temporary numbers for the authenticated user
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  Future<chopper.Response> tnumListPost({String? authorization}) {
    return _tnumListPost(authorization: authorization?.toString());
  }

  ///List all temporary numbers for the authenticated user
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  @Post(
    path: '/tnum/list',
    optionalBody: true,
  )
  Future<chopper.Response> _tnumListPost(
      {@Header('Authorization') String? authorization});

  ///Activate a temporary number
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  Future<chopper.Response> tnumActivatePost({
    String? authorization,
    required ActivateDto? body,
  }) {
    return _tnumActivatePost(
        authorization: authorization?.toString(), body: body);
  }

  ///Activate a temporary number
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  @Post(
    path: '/tnum/activate',
    optionalBody: true,
  )
  Future<chopper.Response> _tnumActivatePost({
    @Header('Authorization') String? authorization,
    @Body() required ActivateDto? body,
  });

  ///Deactivate a temporary number
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  Future<chopper.Response> tnumDeactivatePost({
    String? authorization,
    required DeactivateDto? body,
  }) {
    return _tnumDeactivatePost(
        authorization: authorization?.toString(), body: body);
  }

  ///Deactivate a temporary number
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  @Post(
    path: '/tnum/deactivate',
    optionalBody: true,
  )
  Future<chopper.Response> _tnumDeactivatePost({
    @Header('Authorization') String? authorization,
    @Body() required DeactivateDto? body,
  });

  ///Filter contacts based on criteria
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  Future<chopper.Response> contactsFilterPost({
    String? authorization,
    required String? body,
  }) {
    return _contactsFilterPost(
        authorization: authorization?.toString(), body: body);
  }

  ///Filter contacts based on criteria
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  @Post(
    path: '/contacts/filter',
    optionalBody: true,
  )
  Future<chopper.Response> _contactsFilterPost({
    @Header('Authorization') String? authorization,
    @Body() required String? body,
  });

  ///
  ///@param limit
  ///@param cursor
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  Future<chopper.Response> conversationAllGet({
    required num? limit,
    required String? cursor,
    String? authorization,
  }) {
    return _conversationAllGet(
        limit: limit, cursor: cursor, authorization: authorization?.toString());
  }

  ///
  ///@param limit
  ///@param cursor
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  @Get(path: '/conversation/all')
  Future<chopper.Response> _conversationAllGet({
    @Query('limit') required num? limit,
    @Query('cursor') required String? cursor,
    @Header('Authorization') String? authorization,
  });

  ///
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  Future<chopper.Response> conversationCreateIndividualPost({
    String? authorization,
    required CreateIndividualConversationDto? body,
  }) {
    return _conversationCreateIndividualPost(
        authorization: authorization?.toString(), body: body);
  }

  ///
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  @Post(
    path: '/conversation/create/individual',
    optionalBody: true,
  )
  Future<chopper.Response> _conversationCreateIndividualPost({
    @Header('Authorization') String? authorization,
    @Body() required CreateIndividualConversationDto? body,
  });

  ///
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  Future<chopper.Response> conversationCreateGroupPost(
      {String? authorization}) {
    return _conversationCreateGroupPost(
        authorization: authorization?.toString());
  }

  ///
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  @Post(
    path: '/conversation/create/group',
    optionalBody: true,
  )
  Future<chopper.Response> _conversationCreateGroupPost(
      {@Header('Authorization') String? authorization});
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
