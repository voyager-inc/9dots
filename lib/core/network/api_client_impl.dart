import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ninedots/configs/app_config.dart';
import 'package:ninedots/core/utils/app_exception.dart';
import 'package:ninedots/data/models/response/response.dart';

import 'api_client.dart';
import 'exception/api_handler_mixin.dart';

class ApiClientImpl extends ApiClient with ExceptionHandlerMixin {
  ApiClientImpl({required this.amplifyConfig});

  final String amplifyConfig;

  final timeout = const Duration(seconds: 20);

  @override
  Future<Either<AppException, bool>> configureAmplify() async {
    final String amplifyConfig = await AppConfig.amplifyConfiguration();
    return await handleVoidException(() async {
      if (!Amplify.isConfigured) {
        await Amplify.addPlugins([
          AmplifyAuthCognito(),
          AmplifyStorageS3(),
          AmplifyAPI(),
        ]);
        await Amplify.configure(amplifyConfig);
      }
    });
  }
  
  @override
  Future<Either<AppException, Response>> query(String document, {Map<String, dynamic>? variables}) {
    final res = handleException(
      () => Amplify.API.query(
          request: GraphQLRequest<String>(document: document, variables: variables ?? {}))
          .response.timeout(timeout));

    return res;
  }

  @override
  Future<Either<AppException, Response>> mutate(String document, {Map<String, dynamic>? variables}) {
    final res = handleException(
      () => Amplify.API.mutate(
          request: GraphQLRequest<String>(document: document, variables: variables ?? {}))
          .response.timeout(timeout));

    return res;
  }

  
  @override
  Either<AppException, Response> subscribe(String document, {Map<String, dynamic>? variables, Function()? onEstablished}) {
    final res = handleStreamException(
    () => Amplify.API.subscribe(
        GraphQLRequest<String>(document: document, variables: variables ?? {}), 
        onEstablished: onEstablished));

    return res;
  }

  @override
  Future<Either<AppException, dynamic>> fetchSession() async {
    final res = await handleDynamicException(() async {
      final session = await Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey)
          .fetchAuthSession(
            options: const FetchAuthSessionOptions(forceRefresh: true),
          );
      this.session = session;
      return session;
    });

    return res;
  }
  
}
