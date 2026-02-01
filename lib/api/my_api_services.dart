import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider_task/model/product.dart';

class AppPiServices {
  //* Add your API service methods here *//
  //*get data from API *//
  static const String baseUrl = 'https://dummyjson.com/';

  late final Dio dio;

  AppPiServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }
  Future<List<ProductData>?> getProducts() async {
    try {
      print('Fetching products from API...');
      final response = await dio.get('/products');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['products'];
        final products = data.map((json) => ProductData.fromMap(json)).toList();
        return products;
      }
    } catch (e) {
      print(e);
    }
  }
}
