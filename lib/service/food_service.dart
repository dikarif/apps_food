import 'dart:convert';
import 'package:apps_food/models/food_models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FoodService {
  static final baseUrl = dotenv.env['API_BASE_URL'];

  Future<List<FoodModel>> getMenu({String? idBarang}) async {
    print('getMenu');
    try {
      String url = '$baseUrl/menu';

      if (idBarang != null && idBarang.isNotEmpty) {
        url += '?id=$idBarang';
      }

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);

        if (decodedData['status'] == 'success') {
          // Tangkap data array JSON mentahnya
          List<dynamic> rawData = decodedData['data'];

          return rawData.map((json) => FoodModel.fromJson(json)).toList();
        } else {
          throw Exception(decodedData['message'] ?? 'Gagal memproses data');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error Fetch API Menu: $e');
      throw Exception(e.toString());
    }
  }

  Future<List<FoodModelRekomen>> getMenuRekomen({String? idBarang}) async {
    print('getMenuRekomen');
    try {
      String url = '$baseUrl/menu';

      if (idBarang != null && idBarang.isNotEmpty) {
        url += '?id=$idBarang';
      }

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);

        if (decodedData['status'] == 'success') {
          // Tangkap data array JSON mentahnya
          List<dynamic> rawData = decodedData['data'];

          return rawData
              .map((json) => FoodModelRekomen.fromJson(json))
              .toList();
        } else {
          throw Exception(decodedData['message'] ?? 'Gagal memproses data');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error Fetch API Menu: $e');
      throw Exception(e.toString());
    }
  }
}
