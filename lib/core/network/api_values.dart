class GraphQLDocuments {
  static String checkSmartDeviceAuth(String otp) =>
    '''query CheckSmartDeviceAuth {
      checkSmartDeviceAuth(otp:"$otp") {
        serialNo
        userName
        password
        status
      }
    }
  ''';
}