import 'package:fpdart/fpdart.dart';
import 'package:ninedots/core/utils/app_exception.dart';

abstract class AuthRemoteDatasource {
  Future<Either<AppException, bool>> isSessionLogged();
  Future<Either<AppException, bool>> cognitoSignin(String username, String password);
}