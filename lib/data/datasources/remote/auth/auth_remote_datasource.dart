import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ninedots/core/network/api_client.dart';
import 'package:ninedots/core/utils/app_exception.dart';

abstract class AuthDatasource {
  Future<Either<AppException, bool>> isSessionLogged();
}

class AuthRemoteDatasource extends AuthDatasource {
  final ApiClient apiClient;
  AuthRemoteDatasource(this.apiClient);

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
}
