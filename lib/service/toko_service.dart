import 'dart:convert';
import 'package:apps_food/models/toko_models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TokoService {
  static final baseUrl = dotenv.env['API_BASE_URL'];

  Future<List<TokoModel>> getToko({String? idtoko}) async {
    try {
      String url = '$baseUrl/toko';

      if (idtoko != null && idtoko.isNotEmpty) {
        url += '?id=$idtoko';
      }

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);

        if (decodedData['status'] == 'success') {
          List<dynamic> rawData = decodedData['data'];

          return rawData.map((json) => TokoModel.fromJson(json)).toList();
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
