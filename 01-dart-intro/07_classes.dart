void main(){
  
  final Hero wolverine = new Hero("Logan", "Regeneración");
 
  print(wolverine);
  print("\nNombre: ${wolverine.name}\nAbilidad: ${wolverine.power}");
  
}

class Hero {
 

  
  String name;
  String power;
  
  Hero(String pName, String pPower) :name = pName, power = pPower;

  //Hero(this.name, this.power);
  
}//FIN DE LA CLASE HERO