class User {
  String? id;
  String name;
  String surname;
  String department;
  String position;

  User({
    this.id,
    required this.name,
    required this.surname,
    required this.department,
    required this.position,
  });

  // Метод для преобразования в Map для сохранения в Firebase
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'department': department,
      'position': position,
    };
  }

  factory User.fromMap(Map<String, dynamic> map, String id) {
    return User(
      id: id,
      name: map['name'],
      surname: map['surname'],
      department: map['department'],
      position: map['position'],
    );
  }
}
