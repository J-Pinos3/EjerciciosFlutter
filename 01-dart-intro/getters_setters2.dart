void main(List<String> args) {
  
  var hero = Hero("abc","123");
  hero.fullName = "Jhon";
  print(hero.fullName);
  print(hero.sayName());
}


class Hero { 
  String firstName; 
  String lastName; 

  String get fullName => "$lastName, $firstName"; 
  set fullName(n) => firstName = n; 

  Hero(String fn, String ln): this.firstName = fn,  this.lastName = ln; 
  
  String sayName() { 
    return "$lastName, $firstName  +  $fullName"; 
  } 
}