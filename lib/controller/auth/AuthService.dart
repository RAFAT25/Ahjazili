// file: services/auth_service.dart




import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travelsystem/core/consta/nameRoute.dart';

enum UserStatus { guest, authenticated, loading }

class AuthService extends GetxService {
  final _storage = GetStorage();

  final Rx<UserStatus> userStatus = UserStatus.guest.obs;

  // Storage Keys
  final String _userTokenKey = 'user_token';
  final String _userStatusKey = 'user_status';
  final String _userIdKey = 'user_id';
  final String _userNameKey = 'user_name';
  final String _userEmailKey = 'user_email';
  final String _userPhoneKey = 'user_phone';
  final String _onboardingKey = 'onboarding_seen';

  // Lifecycle Methods
  @override
  void onInit() {
    super.onInit();
    _loadUserStatus();
  }

  void _loadUserStatus() {
    final storedStatus = _storage.read<bool>(_userStatusKey) ?? false;
    if (storedStatus) {
      final token = _storage.read<String>(_userTokenKey);
      if (token != null && token.isNotEmpty) {
        userStatus.value = UserStatus.authenticated;
      } else {
        userStatus.value = UserStatus.guest;
      }
    } else {
      userStatus.value = UserStatus.guest;
    }
  }
  bool hasSeenOnboarding() {
    // اقرأ القيمة من الذاكرة. إذا لم تكن موجودة، افترض أنها false.
    return _storage.read<bool>(_onboardingKey) ?? false;
  }

  /// دالة لضبط أن المستخدم قد أكمل شاشات Onboarding
  /// سيستخدمها OnboardingController عند الضغط على زر "إنهاء".
  Future<void> setOnboardingSeen() async {
    // اكتب القيمة true في الذاكرة لحفظها بشكل دائم.
    await _storage.write(_onboardingKey, true);
    print("AuthService: Onboarding has been marked as seen.");
  }
  // Getters
  bool get isGuest => userStatus.value == UserStatus.guest;
  bool get isAuthenticated => userStatus.value == UserStatus.authenticated;
  bool get isLoading => userStatus.value == UserStatus.loading;

  int? get userId => _storage.read<int>(_userIdKey);
  String? get userName => _storage.read<String>(_userNameKey);
  String? get userEmail=>_storage.read<String>(_userEmailKey);
  // Core Authentication Logic
  Future<Map<String, dynamic>?> login(String identifier, String password) async {
    userStatus.value = UserStatus.loading;
    final Map<String, dynamic> valueData = {"email": identifier,"password": password};
    final String jsonData = json.encode(valueData);
    final response = await http.post(
      Uri.parse("https://travelsystemoline.onrender.com/login_user.php"),
      body: jsonData,
    );
    if (response.statusCode == 200) {
      print("456");
      final body = json.decode(response.body);
      if (body['success'] == true) {
        print("741");
        await _storage.write(_userTokenKey, body['token']);
        await _storage.write(_userIdKey, body['user_id']);
        await _storage.write(_userNameKey, body['user_name']);
        await _storage.write(_userEmailKey, body['user_email']);
        await _storage.write(_userPhoneKey, body['user_phone']);
        await _storage.write(_userStatusKey, true);
        userStatus.value = UserStatus.authenticated;
          print(_userTokenKey);
        return {
          'user_id': body['user_id'],
          'user_name': body['user_name'],
          'token': body['token'],
        };
      }
    }
    userStatus.value = UserStatus.guest;
    print("789");
    return null;

  }

  Future<void> logout() async {
    await _storage.remove(_userTokenKey);
    await _storage.remove(_userIdKey);
    await _storage.remove(_userNameKey);
    await _storage.remove(_userEmailKey);
    await _storage.remove(_userPhoneKey);
    await _storage.write(_userStatusKey, false);
    userStatus.value = UserStatus.guest;
    Get.offAllNamed(AppRoute.Login);
  }

}

