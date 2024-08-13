class CourseEntity {
  String? id;
  String? name;
  String? description;
  String? startAt;

  CourseEntity({
    this.id,
    this.name,
    this.description,
    this.startAt,
  });
  static CourseEntity fromJson(Map<String, dynamic> map) {
    return CourseEntity(
        id: map['id'],
        description: map['description'],
        name: map['name'],
        startAt: map['startAt']);
  }
}
