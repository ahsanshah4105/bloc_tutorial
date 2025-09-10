import 'package:equatable/equatable.dart';

class Person extends Equatable{
  String name;
  int age;

  Person({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}

void main() {
  Person person = Person(name: "Ahsan", age: 23);
  Person person2 = Person(name: "Ahsan", age: 23);
  print(person2.hashCode );
  print(person.hashCode);

  print(person2 == person);
}
