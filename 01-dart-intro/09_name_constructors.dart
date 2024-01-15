void main() {
  
  final  Map<String, dynamic> rawJsonObject ={
    "name":"Peter Parker",
    "powder":"Spider Web",
    "isAlive":false
  };
  
  
  //NEW CONSTRUCTOR
  final ironman = Hero.fromMap(rawJsonObject);
  
  
  
  
  //map to object version 1
//   final spidey = Hero(
     //isAlive6 no existe, por eso puede haber un nll
//     isAlive: rawJsonObject['isAlive6'] ?? false,
//     power: "Fists",
//     name: "Peter Parker"
//   );
  
  
  
   //default objwect
//   var ironman = Hero(
//       isAlive: true,
//       name: "Iron Man",
//       power: "Weapons" );
  
  print(ironman);
}



class Hero {

  String name;
  String power;
  bool isAlive;
  
  
  Hero({
    required this.name,
    required this.power,
    required this.isAlive
  });
  
  
  //<CLASE>.NOMBRE()
  Hero.fromMap( Map<String, dynamic> jsonMap )
    : name=jsonMap['name'] ?? "No name",
      power=jsonMap['power'] ?? "No power",
      isAlive=jsonMap['isAlive'] ?? false;
  
  
  
  @override
  String toString(){
    return "Name: ${this.name} \n   Is Alive: ${isAlive ? 'Living': 'Death'} " +
    "\n   Power: $power \n";
  }
  
}//FIN DE LA CLASE HERO