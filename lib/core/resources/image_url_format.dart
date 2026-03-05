import 'dart:io';

String imageUrlFormatter(String url) {
  if (url.isEmpty) {
    return "https://via.placeholder.com/400";
  }
  if (Platform.isAndroid && url.contains('127.0.0.1')) {
    return url.replaceAll('127.0.0.1', '10.0.2.2');
  }
  return url;
}