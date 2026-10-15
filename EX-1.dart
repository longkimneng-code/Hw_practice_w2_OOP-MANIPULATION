enum Skill { FLUTTER, DART, OTHER }

class Employee {
  String _name;
  double _baseSalary;
  //new attributes
  List<Skill>? _skills = [];
  Address? _address;
  int _experience;


  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}, Experience: $_experience years');
  }

  // getter
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill>? get skills => _skills;
  Address? get address => _address;
  int get experience => _experience;

  //method 
  void computeSalary() {
    for(var skill in _skills ?? []){  // or we can user _skills! instead of _skills ?? []
      if(skill == Skill.FLUTTER){
        _baseSalary += 5000;
      } else if(skill == Skill.DART){
        _baseSalary += 3000;
      } else {
        _baseSalary += 1000;
      }
    }
    _baseSalary += _experience * 2000;
  }

  Employee(this._name, this._baseSalary, {this._address, this._skills, this._experience = 0});
}

class Address {
  String street;
  String city;
  int zipCode;

  Address(this.street, this.city, this.zipCode){}

  @override
  String toString() {
    return '$street, $city, $zipCode';
  } 


}

void main() {
  var emp1 = Employee('Sokea', 40000, skills: [Skill.FLUTTER]);
  emp1.computeSalary();
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000, experience: 5, skills: [Skill.DART, Skill.OTHER]);
  emp2.computeSalary();
  emp2.printDetails();
}