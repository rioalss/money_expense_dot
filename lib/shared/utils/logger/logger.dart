import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger();

  // information logs
  static void i(dynamic data, {String title = ''}) {
    _logger.i(title.isEmpty ? data : {'title': title, 'body': data});
  }

  // warning logs
  static void w(dynamic data, {String title = ''}) {
    _logger.w(title.isEmpty ? data : {'title': title, 'body': data});
  }

  // error logs
  static void e(dynamic data, {String title = ''}) {
    _logger.e(title.isEmpty ? data : {'title': title, 'body': data});
  }

  // debug logs
  static void d(dynamic data, {String title = ''}) {
    _logger.d(title.isEmpty ? data : {'title': title, 'body': data});
  }
}
