import 'package:country_app/country_provider.dart';
import 'package:country_app/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateProvider<String?>((ref) => null);

// Tạo StateNotifierProvider cho AuthNotifier
final authNotifierProvider = StateNotifierProvider<AuthNotifier, String?>((ref) {
  return AuthNotifier(ref);  // Truyền ref vào constructor
});

class AuthNotifier extends StateNotifier<String?> {
  final Ref ref;  // Đảm bảo sử dụng Ref thay vì Reader

  AuthNotifier(this.ref) : super(null);

  // Đăng nhập và lưu token vào trạng thái
  Future<void> login(String username, String password) async {
    final apiService = ApiService();
    final token = await apiService.login(username, password);
    if (token != null) {
      state = token;
      ref.read(authProvider.notifier).state = token; // Cập nhật giá trị token vào authProvider
    }
  }
}
