import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ninedots/core/network/api_client.dart';
import 'package:ninedots/core/utils/app_exception.dart';
import 'package:ninedots/data/datasources/remote/auth/auth_remote_datasource.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  final ApiClient apiClient;
  AuthRemoteDatasourceImpl(this.apiClient);

  @override
  Future<Either<AppException, bool>> isSessionLogged() async {
    final response = await apiClient.fetchSession();
    return response.fold(
      (l) => Left(l),
      (session) {
        final CognitoAuthSession result = session as CognitoAuthSession;
        return Right(result.isSignedIn);
      },
    );
  }

  @override
  Future<Either<AppException, bool>> cognitoSignin(String username, String password) async {
    final response = await apiClient.signin(username, password);
    return response.fold((l) => Left(l), (result) => Right(result));
  }
}
