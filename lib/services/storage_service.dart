import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

class StorageService {
  static const _key = 'smart_khata_data_v1';
  Future<AppData> load() async { final p = await SharedPreferences.getInstance(); final raw = p.getString(_key); return raw == null ? const AppData() : AppData.decode(raw); }
  Future<void> save(AppData data) async { final p = await SharedPreferences.getInstance(); await p.setString(_key, data.encode()); }
  Future<void> clear() async { final p = await SharedPreferences.getInstance(); await p.remove(_key); }
}
