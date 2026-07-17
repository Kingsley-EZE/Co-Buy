import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Persists auth tokens in the platform keychain/keystore.
///
/// The only place in the app that touches raw token strings; everything else
/// goes through [AuthInterceptor] or an auth repository.
@lazySingleton
class TokenStorage {
  TokenStorage(this._storage);

  final FlutterSecureStorage _storage;

  static const _kAccess = 'access_token';
  static const _kRefresh = 'refresh_token';

  Future<String?> readAccessToken() => _storage.read(key: _kAccess);

  Future<String?> readRefreshToken() => _storage.read(key: _kRefresh);

  /// [refresh] is optional while the login API ships without a refresh
  /// token; when absent, any stored refresh token is left untouched.
  Future<void> saveTokens({required String access, String? refresh}) async {
    await _storage.write(key: _kAccess, value: access);
    if (refresh != null) await _storage.write(key: _kRefresh, value: refresh);
  }

  Future<void> clear() => _storage.deleteAll();
}
