class Employee {
  int id;
  String name;
  int isTrue;

  Employee({this.id, this.name, this.isTrue});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'isTrue': isTrue,
    };
    return map;
  }

  Employee.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    isTrue = map['isTrue'];
  }
}
