class ApiKeys {
  // Store your API key here after user login
  static String? userApiKey;

  // Headers for authenticated requests
  static Map<String, String> get authHeaders {
    if (userApiKey == null) {
      return {};
    }
    return {'apikey': userApiKey!};
  }
}
