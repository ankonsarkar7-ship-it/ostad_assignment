
//TODO: A. Define Interface Role
abstract class Role {
  void displayRole();
}

//TODO: B. Person Class
class Person implements Role {
  final String name;
  final int age;
  final String address;

  Person(this.name, this.age, this.address);

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  @override
  void displayRole() {
    print("Role: Person");
  }
}

//TODO: C. Student Class Extending Person
class Student extends Person {
  final String studentID;
  final String grade;
  final List<double> courseScores;

  Student({
    required String name,
    required int age,
    required String address,
    required this.studentID,
    required this.grade,
    required this.courseScores,
  }) : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverage() {
    if (courseScores.isEmpty) return 0.0;
    double sum = courseScores.reduce((a, b) => a + b);
    return double.parse((sum / courseScores.length).toStringAsFixed(1));
  }
}

//TODO: D. Teacher Class Extending Person
class Teacher extends Person {
  final String teacherID;
  final List<String> coursesTaught;

  Teacher({
    required String name,
    required int age,
    required String address,
    required this.teacherID,
    required this.coursesTaught,
  }) : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCourses() {
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

//TODO: E. StudentManagementSystem Main
void main() {
  // Student instance
  Student student = Student(
    name: "John Doe",
    age: 20,
    address: "123 Main St",
    studentID: "S123",
    grade: "A",
    courseScores: [90, 85, 82],
  );

  print("Student Information:");
  student.displayRole();
  print("Name: ${student.getName}");
  print("Age: ${student.getAge}");
  print("Address: ${student.getAddress}");
  print("Average Score: ${student.calculateAverage()}\n");

  // Teacher instance
  Teacher teacher = Teacher(
    name: "Mrs. Smith",
    age: 35,
    address: "456 Oak St",
    teacherID: "T456",
    coursesTaught: ["Math", "English", "Bangla"],
  );

  print("Teacher Information:");
  teacher.displayRole();
  print("Name: ${teacher.getName}");
  print("Age: ${teacher.getAge}");
  print("Address: ${teacher.getAddress}");
  print("Courses Taught:");
  teacher.displayCourses();
}

