import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/data/datasources/local/auth/providers/auth_local_datasource_provider.dart';
import 'package:ninedots/data/datasources/remote/auth/providers/auth_datasource_provider.dart';
import 'package:ninedots/data/repositories/auth_repository_impl.dart';
import 'package:ninedots/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDatasource = ref.watch(authRemoteDatasourceProvider);
  final localDatasource = ref.watch(authLocalDatasourceProvider);
  final repository = AuthRepositoryImpl(
    remoteDatasource: remoteDatasource,
    localDatasource: localDatasource,
  );
  return repository;
});
