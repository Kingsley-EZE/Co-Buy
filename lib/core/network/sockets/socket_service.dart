import 'dart:async';
import 'dart:developer';
import 'package:co_buy/core/config/app_config.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

/// Singleton socket service. Call SocketService.instance anywhere.
class SocketService {
  SocketService._();
  static final SocketService instance = SocketService._();

  IO.Socket? _socket;
  bool get isConnected => _socket?.connected ?? false;

  /// Call once after login
  void connect(String token) {
    _socket?.dispose();

    _socket = IO.io(
      AppConfig.env.socketBaseUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({'token': token})
          .enableReconnection()
          .build(),
    );

    _socket!.onConnect((_) => print('[Socket] Connected'));
    _socket!.onDisconnect((_) => print('[Socket] Disconnected'));
    _socket!.onConnectError((err) => print('[Socket] Error: $err'));
  }

  /// Call on logout
  void disconnect() {
    _socket?.dispose();
    _socket = null;
  }

  /// Subscribe to a pool's updates
  void joinPool(String poolId) {
    _socket?.emit('pool:subscribe', {'poolId': poolId});
  }

  /// Unsubscribe from a pool
  void leavePool(String poolId) {
    _socket?.emit('pool:unsubscribe', {'poolId': poolId});
  }

  /// Listen to any event — returns a stream you can use in a Bloc
  Stream<T> on<T>(String event) {
    final controller = StreamController<T>.broadcast();

    _socket?.on(event, (data) {
      log('[Socket-DATA] $event: $data');
      if (!controller.isClosed) {
        // socket.io wraps all event arguments in a List; unwrap to the first
        // element so callers receive the payload directly.
        final payload = data is List ? data[0] : data;
        controller.add(payload as T);
      }
    });

    return controller.stream;
  }
}