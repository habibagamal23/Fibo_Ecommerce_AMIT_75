abstract class ApiService {
  Future<dynamic> post(String Url, Map<String, dynamic> body);
  Future<dynamic> get(String url);
  Future<dynamic> put(String url, Map<String, dynamic> body);
}
