abstract class IBaseDataSource {
  Future<dynamic> get(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers});
}
