import 'package:fpdart/fpdart.dart';
import 'package:ninedots/core/utils/app_exception.dart';
import 'package:ninedots/data/datasources/local/auth/auth_local_datasource.dart';
import 'package:ninedots/data/datasources/remote/auth/auth_remote_datasource.dart';
import 'package:ninedots/domain/repositories/index.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;
  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<Either<AppException, bool>> isSessionLogged() {
    return remoteDatasource.isSessionLogged();
  }

  @override
  Future<Either<AppException, bool>> cognitoResignin() async {
    final String? localUsername = localDatasource.loggedUsername();
    final String? localPassword = localDatasource.loggedPassword();
    if (localUsername?.isNotEmpty == true && localPassword?.isNotEmpty == true) {
      final result = await cognitoSignin(localUsername!, localPassword!);
      return result.fold((l) => Left(l), (r) {
        if (r == false) {
          //expiredSession
        }
        return Right(r);
      });
    } else {
      return const Right(false);
    }
  }

  @override
  Future<Either<AppException, bool>> cognitoSignin(String username, String password) {
    return remoteDatasource.cognitoSignin(username, password);
  }

  @override
  bool isLocalLogged() {
    return localDatasource.isLogged();
  }
}
