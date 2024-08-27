import 'package:flutter/material.dart';
import 'package:flutterteste/controller/course_controller.dart';
import 'package:flutterteste/model/course_model.dart';

class FormNewCoursePage extends StatefulWidget {
  const FormNewCoursePage({super.key});

  @override
  State<FormNewCoursePage> createState() => _FormNewCoursePageState();
}

class _FormNewCoursePageState extends State<FormNewCoursePage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController textNameController = TextEditingController();
  TextEditingController textDescriptionController = TextEditingController();
  TextEditingController textStartAtController = TextEditingController();

  CourseController controller = CourseController();

  postNewCourse() async {
    try {
      await controller.postNewCourse(
        CourseEntity(
          name: textNameController.text,
          description: textDescriptionController.text,
          startAt: textStartAtController.text,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Curso cadastrado com sucesso!"),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Formulário de curso", overflow: TextOverflow.ellipsis),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: textNameController,
                validator: (value) =>
                    value!.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? "Campo obrigatório" : null,
                controller: textDescriptionController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? "Campo obrigatório" : null,
                controller: textStartAtController,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 48,
                width: MediaQuery.sizeOf(context).width, //100%
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      postNewCourse();
                    }
                  },
                  child: const Text("Salvar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
