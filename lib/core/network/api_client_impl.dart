import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:injectable/injectable.dart';

import 'api_client.dart';

@Injectable(as: ApiClient)
class ApiClientImpl implements ApiClient {
  ApiClientImpl({required this.amplifyConfig});

  final String amplifyConfig;

  @override
  Future<void> configureAmplify() async {
    try {
      if (!Amplify.isConfigured) {
        await Amplify.addPlugins(
            [AmplifyAuthCognito(), AmplifyStorageS3(), AmplifyAPI()]);

        await Amplify.configure(amplifyConfig);
      }
    } catch (e, s) {}
  }
}
