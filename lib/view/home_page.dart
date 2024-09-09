import 'package:flutter/material.dart';
import 'package:flutterteste/controller/course_controller.dart';
import 'package:flutterteste/model/course_model.dart';
import 'package:flutterteste/view/form_new_course_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterteste/view/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CourseController controller = CourseController();

  late Future<List<CourseEntity>> _futureCourses;

  Future<List<CourseEntity>> getCourses() async {
    return await controller.getCourseList();
  }

  void navigateToForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FormNewCoursePage(),
      ),
    ).then((value) {
      _futureCourses = getCourses();
      setState(() {
        _futureCourses = getCourses();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _futureCourses = getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(
        selectedMenuItem: 0,
      ),
      appBar: AppBar(
        title: const Text("Lista de cursos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToForm,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _futureCourses,
        builder: (context, AsyncSnapshot<List<CourseEntity>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FormNewCoursePage(
                                          courseEdit: snapshot
                                              .data![index]))).then((value) {
                                _futureCourses = getCourses();
                                setState(() {});
                              });
                            },
                            icon: Icons.edit,
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white,
                          ),
                          const SlidableAction(
                            onPressed: null,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      child: ListTile(
                        title:
                            Text(snapshot.data![index].name ?? 'Não informado'),
                        subtitle: Text(snapshot.data![index].description ??
                            'Não informado'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        leading: const CircleAvatar(
                          child: Text("CC"),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
