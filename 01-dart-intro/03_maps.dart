void main() {

  //clave: valor
  //todas las claves deben ser del mismo tipo de dato
  final Map<String, dynamic> pokemon = {
    'name': 'Ditto',
    'life': 100.00,
    'type': "fire",
    'abilities': <String>["explosión","fuego","confusión"],
    'sprites' : <int, String>{
        1:"ditto/front.png",
        2:"ditto/back.png"//no se debe poner map de nuevo
      }
  };
  
  print("Name: " + pokemon['name'] + "\nLife: ${pokemon['life']}" + "\nAbilities:");
  
  for(int i = 0; i < pokemon['abilities'].length; i++){
    print("\t"+pokemon['abilities'][i].toUpperCase());
  }
  
  print("Back: ${ pokemon['sprites'][2] }");
  print("Front: ${ pokemon['sprites'][1] }");
  
}//MÉTODO DE MAIN
