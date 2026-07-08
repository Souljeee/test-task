import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionRepository {
  static const String _key = 'has_subscription';

  const SubscriptionRepository();

  Future<void> saveSubscription({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
  }

  Future<bool> hasSubscription() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }
}
