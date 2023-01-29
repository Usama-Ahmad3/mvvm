abstract class BaseApiService {
  Future<dynamic> getApiResponse(String url, data);

  Future<dynamic> PostApiResponse(String url, dynamic data);
}
