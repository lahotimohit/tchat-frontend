// ignore_for_file: type=lint
import 'package:tchat_frontend/generated_api/authentication/client_mapping.dart';
import 'tchat_pp_storage.models.swagger.dart';
import 'package:chopper/chopper.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:chopper/chopper.dart' as chopper;
export 'tchat_pp_storage.models.swagger.dart';

part 'tchat_pp_storage.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class TchatPpStorage extends ChopperService {
  static TchatPpStorage create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$TchatPpStorage(client);
    }

    final newClient = ChopperClient(
        services: [_$TchatPpStorage()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$TchatPpStorage(newClient);
  }

  ///
  Future<chopper.Response> imagesUploadPost() {
    return _imagesUploadPost();
  }

  ///
  @Post(
    path: '/images/upload',
    optionalBody: true,
  )
  Future<chopper.Response> _imagesUploadPost();

  ///Upload profile picture
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  Future<chopper.Response<ProfilePictureUploadPost$Response>>
      profilePictureUploadPost({
    String? authorization,
    required http.MultipartFile file,
  }) {
    generatedMapping.putIfAbsent(ProfilePictureUploadPost$Response,
        () => ProfilePictureUploadPost$Response.fromJsonFactory);

    return _profilePictureUploadPost(
        authorization: authorization?.toString(), file: file);
  }

  ///Upload profile picture
  ///@param Authorization Sending the access token as Bearer <access_token_here>
  @Post(
    path: '/profile-picture/upload',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response<ProfilePictureUploadPost$Response>>
      _profilePictureUploadPost({
    @Header('Authorization') String? authorization,
    @PartFile() required http.MultipartFile file,
  });

  ///
  Future<chopper.Response> get() {
    return _get();
  }

  ///
  @Get(path: '/')
  Future<chopper.Response> _get();
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
