abstract class BaseApiService{

  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data, {bool sendAsJson = true});
  Future<dynamic> getPatchApiResponse(String url, dynamic data);
}