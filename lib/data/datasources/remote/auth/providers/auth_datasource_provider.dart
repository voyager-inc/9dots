import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/core/network/providers/network_provider.dart';
import 'package:ninedots/data/datasources/remote/auth/auth_remote_datasource.dart';
import 'package:ninedots/data/datasources/remote/auth/auth_remote_datasource_impl.dart';

final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) =>
    AuthRemoteDatasourceImpl(ref.watch(apiClientProvider)));