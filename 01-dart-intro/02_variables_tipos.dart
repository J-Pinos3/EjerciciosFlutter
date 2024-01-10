void main() {

  final String pokemon = "Ditto";
  final String funName = "ToDitto";
  final int hp = 100;
  final bool isAlive = true;
  //var isAlive = false;
  final abilities = ["impostor","fuego","explosión"];
//   final abilities = <String>["impostor","fuego","explosión"];
//   final List<String> abilities = ["impostor","fuego","explosión"];
  final sprites = <String>["ditto/front.png",
                          "ditto/back.png"];
  //var String color  = "azul"; NO SE PUEDE PONER VAR Y EL TIPO DE DATO JUNTOS
  

  //NULL SAFETY
  //int a = null; a NO PUEDE RECIBIR UN NULL
  int? a = null;
  int? b;
  b = 45;

  //EL OPERADOR ?? devuelve lo de la izquierda si no es nulo
  print(1 ?? 6);//1
  print(null ?? 6);//6
  print("hola" ?? null);//hola

  //inicialmente nulo
  int? value;
  //??= solo le asigna el valor si la variable es nula
  value ??= 7;

  //CUIDADO CON DYNAMIC
  dynamic errorMessage = 'Hola';
  errorMessage = false;
  errorMessage = {0,2,4,6,8};
  errorMessage = ()=> true;
  errorMessage = null;
  
  print("""
  $pokemon (${funName.toUpperCase()}) $hp
  $isAlive
  $abilities
  $sprites
  $errorMessage
  """);
}
