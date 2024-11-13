import 'package:country_app/models/country.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = "https://6732cc462a1b1a4ae110f1fc.mockapi.io/api/v1";

  // Lấy danh sách quốc gia
  Future<List<Country>> getCountries() async {
    try {
      var response = await _dio.get('$baseUrl/countries');
      List<Country> countries = (response.data as List)
          .map((country) => Country.fromJson(country))
          .toList();
      return countries;
    } catch (e) {
      print(e);
      return [];
    }
  }

  // Thêm quốc gia mới
  Future<void> addCountry(Country country) async {
    try {
      await _dio.post(
        '$baseUrl/countries',
        data: country.toJson(),
      );
    } catch (e) {
      print(e);
    }
  }

  // Cập nhật quốc gia
  Future<void> updateCountry(int id, Country country) async {
    try {
      await _dio.put(
        '$baseUrl/countries/$id',
        data: country.toJson(),
      );
    } catch (e) {
      print(e);
    }
  }

  // Xóa quốc gia
  Future<void> deleteCountry(String id) async {
    try {
      await _dio.delete('$baseUrl/countries/$id');
    } catch (e) {
      print(e);
    }
  }

  // Đăng nhập và lưu token
  Future<String?> login(String username, String password) async {
    try {
      var response = await _dio.post(
        '$baseUrl/login',
        data: {'username': username, 'password': password},
      );
      return response.data['token']; // Giả sử API trả về token
    } catch (e) {
      print(e);
      return null;
    }
  }
}
