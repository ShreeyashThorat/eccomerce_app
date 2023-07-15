import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api.dart';
import 'package:ecommerce_app/data/models/product/product_model.dart';

class ProductRepository {
  final api = Api();

  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      Response response = await api.sendRequest.get("/product");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (response.statusCode == 200) {
        if (!apiResponse.success) {
          throw apiResponse.message.toString();
        }

        return (apiResponse.data as List<dynamic>)
            .map((json) => ProductModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to fetch data from API');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> fetchProductsByCategory(String categoryId) async {
    try {
      Response response =
          await api.sendRequest.get("/product/category/$categoryId");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (response.statusCode == 200) {
        if (!apiResponse.success) {
          throw apiResponse.message.toString();
        }

        return (apiResponse.data as List<dynamic>)
            .map((json) => ProductModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to fetch data from API');
      }
    } catch (e) {
      rethrow;
    }
  }
}
