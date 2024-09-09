import 'package:flutterteste/model/course_model.dart';
import 'package:flutterteste/model/course_repository.dart';

class CourseController {
  CourseRepository repository = CourseRepository();

  Future<List<CourseEntity>> getCourseList() async {
    List<CourseEntity> list = await repository.getAll();
    //aqui eu poderia filtrar, formatar, regras, etc na LIST
    return list;
  }

  postNewCourse(CourseEntity courseEntity) async {
    try {
      await repository.postNewCourse(courseEntity);
    } catch (e) {
      rethrow;
    }
  }

  putUpdateCourse(CourseEntity courseEntity) async {
    try {
      await repository.putUpdateCourse(courseEntity);
    } catch (e) {
      rethrow;
    }
  }

  getLettersFromAvatar(String name) {
    String initials = name.split(" ").map((word) => word[0]).join('');
    return initials.substring(0, 2);
  }
}
