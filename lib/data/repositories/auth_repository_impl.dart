import 'package:injectable/injectable.dart';
import 'package:ninedots/domain/repositories/index.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<bool> fetchAuth() async {
    return false;
  }
}
