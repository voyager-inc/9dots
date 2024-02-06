import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/core/network/providers/network_provider.dart';
import 'package:ninedots/data/datasources/remote/auth/auth_remote_datasource.dart';

final authDatasourceProvider = Provider<AuthDatasource>((ref) =>
    AuthRemoteDatasource(ref.watch(apiClientProvider)));