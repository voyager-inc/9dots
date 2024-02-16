import 'package:ninedots/core/core_services/local_services/hive_service.dart';
import 'package:ninedots/data/datasources/local/auth/auth_local_datasource.dart';

class AuthLocalDatasourceImpl extends AuthLocalDatasource {
  final HiveService service;
  AuthLocalDatasourceImpl(this.service);

  @override
  bool isLogged() {
    return service.getBool("isLoggedIn");
  }

  @override
  String? loggedPassword() {
    return service.getStr("password");
  }

  @override
  String? loggedUsername() {
    return service.getStr("username");
  }

}
