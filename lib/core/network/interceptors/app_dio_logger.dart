import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';

/// Compact, colorized request/response logger.
///
/// Unlike PrettyDioLogger's line-per-field walls of text, this emits one
/// entry per event with a scannable summary line:
///
///   [APP] → GET /auth/me
///   [APP] ← 200 GET /auth/me (312ms)
///
/// followed by (optional) dimmed headers and an indented JSON body. The [tag]
/// identifies which Dio instance the traffic went through, so app calls and
/// token-refresh calls are distinguishable in the console.
///
/// Dev-only by construction — only add it behind an `AppConfig.isDev` check.
class AppDioLogger extends Interceptor {
  AppDioLogger({
    required this.tag,
    this.logHeaders = true,
    this.logBodies = true,
    this.useColors = true,
  });

  /// Short label identifying the Dio instance (e.g. `APP`, `REFRESH`).
  final String tag;
  final bool logHeaders;
  final bool logBodies;

  /// ANSI colors render in most terminals and IDE run consoles; turn off if
  /// yours shows raw `\x1B[...m` escapes instead.
  final bool useColors;

  static const _kStartTime = '_app_dio_logger_start';

  // ANSI escape codes.
  static const _reset = '\x1B[0m';
  static const _bold = '\x1B[1m';
  static const _dim = '\x1B[90m';
  static const _cyan = '\x1B[36m';
  static const _green = '\x1B[32m';
  static const _yellow = '\x1B[33m';
  static const _red = '\x1B[31m';

  String _paint(String text, String color) =>
      useColors ? '$color$text$_reset' : text;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra[_kStartTime] = DateTime.now();

    final buffer = StringBuffer()
      ..writeln(_paint('→ ${options.method} ${options.uri}', _cyan + _bold));
    if (logHeaders) _writeHeaders(buffer, options.headers);
    if (logBodies) _writeBody(buffer, options.data);

    _log(buffer);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode ?? 0;
    final color = status >= 400
        ? _red
        : status >= 300
        ? _yellow
        : _green;

    final buffer = StringBuffer()
      ..writeln(
        '${_paint('← $status', color + _bold)} '
        '${_paint('${response.requestOptions.method} ${response.requestOptions.uri}', color)}'
        '${_paint(_elapsed(response.requestOptions), _dim)}',
      );
    if (logBodies) _writeBody(buffer, response.data);

    _log(buffer);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode;

    final buffer = StringBuffer()
      ..writeln(
        '${_paint('✗ ${status ?? err.type.name}', _red + _bold)} '
        '${_paint('${err.requestOptions.method} ${err.requestOptions.uri}', _red)}'
        '${_paint(_elapsed(err.requestOptions), _dim)}',
      );
    if (err.message != null) {
      buffer.writeln(_paint('  ${err.message}', _red));
    }
    if (logBodies) _writeBody(buffer, err.response?.data);

    _log(buffer);
    handler.next(err);
  }

  String _elapsed(RequestOptions options) {
    final start = options.extra[_kStartTime];
    if (start is! DateTime) return '';
    return ' (${DateTime.now().difference(start).inMilliseconds}ms)';
  }

  void _writeHeaders(StringBuffer buffer, Map<String, dynamic> headers) {
    for (final entry in headers.entries) {
      buffer.writeln(_paint('  ${entry.key}: ${entry.value}', _dim));
    }
  }

  void _writeBody(StringBuffer buffer, Object? data) {
    if (data == null) return;
    final rendered = switch (data) {
      FormData() =>
        'FormData(fields: ${data.fields.length}, '
            'files: ${data.files.length})',
      Map() || List() => _prettyJson(data),
      _ => data.toString(),
    };
    if (rendered.isEmpty) return;
    buffer.writeln(rendered.split('\n').map((l) => '  $l').join('\n'));
  }

  String _prettyJson(Object data) {
    try {
      return const JsonEncoder.withIndent('  ').convert(data);
    } catch (_) {
      return data.toString();
    }
  }

  void _log(StringBuffer buffer) {
    developer.log(buffer.toString().trimRight(), name: tag);
  }
}
