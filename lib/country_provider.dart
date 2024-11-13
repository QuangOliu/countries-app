import 'package:country_app/models/country.dart';
import 'package:country_app/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryProvider = StateNotifierProvider<CountryNotifier, List<Country>>((ref) {
  return CountryNotifier(ref);
});

class CountryNotifier extends StateNotifier<List<Country>> {
  final Ref ref;
  CountryNotifier(this.ref) : super([]);

  // Lấy danh sách quốc gia từ API
  Future<void> fetchCountries() async {
    try {
      final apiService = ApiService();
      final countries = await apiService.getCountries();
      state = countries;
    } catch (error) {
      print('Error fetching countries: $error');
      state = [];
    }
  }

  // Thêm quốc gia mới
  Future<void> addCountry(Country country) async {
    try {
      final apiService = ApiService();
      await apiService.addCountry(country);  // Gọi API thêm quốc gia
      await fetchCountries();  // Làm mới danh sách quốc gia
    } catch (error) {
      print('Error adding country: $error');
    }
  }

  // Xóa quốc gia
  Future<void> deleteCountry(String id) async {
    try {
      final apiService = ApiService();
      await apiService.deleteCountry(id);  // Gọi API xóa quốc gia
      await fetchCountries();  // Làm mới danh sách quốc gia
    } catch (error) {
      print('Error deleting country: $error');
    }
  }
}
