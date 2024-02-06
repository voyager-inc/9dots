import 'dart:async';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ninedots/core/utils/app_exception.dart';
import 'package:ninedots/data/models/response/response.dart';

abstract class ApiClient {
  CognitoAuthSession? session;

  Future<Either<AppException, bool>> configureAmplify();

  Future<Either<AppException, dynamic>> fetchSession();

  Future<Either<AppException, Response>> query(String document, {Map<String, dynamic>? variables});

  Future<Either<AppException, Response>> mutate(String document, {Map<String, dynamic>? variables});

  Either<AppException, Response> subscribe(String document,
      {Map<String, dynamic>? variables, Function()? onEstablished});

}
