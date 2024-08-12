import 'package:dio/dio.dart';
import 'package:never_test/service/api_service.dart';

class DepartmentAPI {
  Future<Response> getDepartments() async {
    var path = "/api/v1/departments";
    Future<Response> res = ApiService.client.get(path);
    return res;
  }

  Future<Response> getProducts(String productId) async {
    var path = "/api/v1/departments/$productId/products";
    Future<Response> res = ApiService.client.get(path);
    return res;
  }
}
