class FeriadoEntity {
  String date;
  String name;
  String type;

  FeriadoEntity({
    required this.date,
    required this.name,
    required this.type,
  });

  get length => null;
  static FeriadoEntity fromJson(Map<String, dynamic> map) {
    return FeriadoEntity(
        date: map['date'], name: map['name'], type: map['type']);
  }
}
