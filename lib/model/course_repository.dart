import 'package:flutterteste/core/constants.dart';
import 'package:http/http.dart' as http;

class CourseRepository {
  final Uri url = Uri.parse('$urlBaseApi/course');
  getAll() {
    final response = http.get(url);
  }
}
