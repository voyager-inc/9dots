import 'dart:io';

import 'package:amplify_api/amplify_api.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ninedots/core/network/api_client.dart';
import 'package:ninedots/core/utils/app_exception.dart';
import 'package:ninedots/data/models/response/response.dart';

mixin ExceptionHandlerMixin on ApiClient {
  Future<Either<AppException, Response>> handleException<T extends Object>(Future<GraphQLResponse<dynamic>> Function() handler) async {
    try {
      final res = await handler();
      
      return Right(Response(
        statusCode: 200,
        data: res.data,
        statusMessage: "",
      ));
    } catch (ex) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      switch (ex.runtimeType) {
        case SocketException:
          ex as SocketException;
          message = 'unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${ex.message}\n';
          break;

        default:
          message = 'unknown error occurred';
          statusCode = 0;
          identifier = 'unknown error ${ex.toString()}\n';
          break;
      }
      return Left(AppException(
          message: message, statusCode: statusCode, identifier: identifier,which: 'http'));
    }
  }

  Either<AppException, Response> handleStreamException<T extends Object>(Stream<GraphQLResponse<dynamic>> Function() handler)  {
    try {
      final res = handler();
      
      return Right(Response(
        statusCode: 200,
        data: res,
        statusMessage: "",
      ));
    } catch (ex) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      switch (ex.runtimeType) {
        case SocketException:
          ex as SocketException;
          message = 'unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${ex.message}\n';
          break;

        default:
          message = 'unknown error occurred';
          statusCode = 0;
          identifier = 'unknown error ${ex.toString()}\n';
          break;
      }
      return Left(AppException(
          message: message, statusCode: statusCode, identifier: identifier,which: 'http'));
    }
  }

  Future<Either<AppException, bool>> handleVoidException<T extends Object>(Future<void> Function() handler) async {
    try {
      await handler();
      return const Right(true);
    } catch (ex) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      switch (ex.runtimeType) {
        case SocketException:
          ex as SocketException;
          message = 'unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${ex.message}\n';
          break;

        default:
          message = 'unknown error occurred';
          statusCode = 0;
          identifier = 'unknown error ${ex.toString()}\n';
          break;
      }
      return Left(AppException(
          message: message, statusCode: statusCode, identifier: identifier,which: 'http'));
    }
  }

  Future<Either<AppException, dynamic>> handleDynamicException<T extends Object>(Future<dynamic> Function() handler) async {
    try {
      final res = await handler();
      return Right(res);
    } catch (ex) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      switch (ex.runtimeType) {
        case SocketException:
          ex as SocketException;
          message = 'unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${ex.message}\n';
          break;

        default:
          message = 'unknown error occurred';
          statusCode = 0;
          identifier = 'unknown error ${ex.toString()}\n';
          break;
      }
      return Left(AppException(
          message: message, statusCode: statusCode, identifier: identifier,which: 'http'));
    }
  }
}