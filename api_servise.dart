import 'package:dio/dio.dart';

import 'end_point.dart';

class ApiService{
  final String _baseUrl = 'https://api.spoonacular.com/recipes/complexSearch';
  final Dio _dio = Dio();
  Future<Map<String, dynamic>>getAllRecipes()async{

    final response = await _dio.get('$_baseUrl$EndPoints.recipes}');
    return response.data;

    }

}