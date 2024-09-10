import 'package:flutter/material.dart';
import 'package:flutterteste/controller/course_controller.dart';
import 'package:flutterteste/model/course_model.dart';

class FormNewCoursePage extends StatefulWidget {
  final CourseEntity? courseEdit;
  const FormNewCoursePage({super.key, this.courseEdit});

  @override
  State<FormNewCoursePage> createState() => _FormNewCoursePageState();
}

class _FormNewCoursePageState extends State<FormNewCoursePage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController textNameController = TextEditingController();
  TextEditingController textDescriptionController = TextEditingController();
  TextEditingController textStartAtController = TextEditingController();
  String id = "";

  CourseController controller = CourseController();
  @override
  void initState() {
    if (widget.courseEdit != null) {
      id = widget.courseEdit?.id ?? "";
      textNameController.text = widget.courseEdit?.name ?? "";
      textDescriptionController.text = widget.courseEdit?.description ?? "";
      textStartAtController.text = controller.dateTimeFormatToStringPtBr(
              DateTime.parse(widget.courseEdit?.startAt ?? "")) ??
          "--/--/----";
    }
    super.initState();
  }

  postNewCourse() async {
    try {
      await controller.postNewCourse(
        CourseEntity(
          name: textNameController.text,
          description: textDescriptionController.text,
          startAt: controller.dateFormatStringPtBrToAPI(
            textStartAtController.text,
          ),
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

  putUpdateCourse() async {
    try {
      await controller.putUpdateCourse(
        CourseEntity(
          id: id,
          name: textNameController.text,
          description: textDescriptionController.text,
          startAt: controller.dateFormatStringPtBrToAPI(
            textStartAtController.text,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Curso atualizado com sucesso!"),
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
                decoration: const InputDecoration(
                  labelText: "Nome",
                ),
                controller: textNameController,
                validator: (value) =>
                    value!.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Descrição",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Campo obrigatório" : null,
                controller: textDescriptionController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Data de início",
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2030),
                    locale: const Locale('pt', 'BR'),
                  ).then((value) {
                    if (value != null) {
                      textStartAtController.text =
                          controller.dateTimeFormatToStringPtBr(value);
                    }
                  });
                },
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
                      if (widget.courseEdit != null) {
                        putUpdateCourse();
                      } else {
                        postNewCourse();
                      }
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
