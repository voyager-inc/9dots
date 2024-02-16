import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/core/core_services/local_services/providers/hive_provider.dart';
import 'package:ninedots/data/datasources/local/auth/auth_local_datasource.dart';
import 'package:ninedots/data/datasources/local/auth/auth_local_datasource_impl.dart';

final authLocalDatasourceProvider = Provider<AuthLocalDatasource>((ref) =>
    AuthLocalDatasourceImpl(ref.watch(hiveServiceProvider)));