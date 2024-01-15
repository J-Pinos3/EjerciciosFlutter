void main() {
  final Hero wolverine = new Hero(name:"Logan", power:"Regeneración");

  print(wolverine);//es igual a print(wolverine.toString());
  print("\nNombre: ${wolverine.name}\nAbilidad: ${wolverine.power}");
}



class Hero {
  String name;
  String power;

  // Hero(String pName, String pPower) :name = pName, power = pPower;
  Hero({
    required this.name, 
    required this.power
    });


    @override
    String toString() {
    
    return "Héroe: $name\tAbilidad: $power";
    }

  //Hero(this.name, this.power);
}//FIN DE LA CLASE HERO