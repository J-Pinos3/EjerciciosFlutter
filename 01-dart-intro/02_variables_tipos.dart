void main() {

  final String pokemon = "Ditto";
  final int hp = 100;
  final bool isAlive = true;
  //var isAlive = false;
  final abilities = ["impostor","fuego","explosión"];
//   final abilities = <String>["impostor","fuego","explosión"];
//   final List<String> abilities = ["impostor","fuego","explosión"];
  final sprites = <String>["ditto/front.png",
                          "ditto/back.png"];
  
  
  //CUIDADO CON DYNAMIC
  dynamic errorMessage = 'Hola';
  errorMessage = false;
  errorMessage = {0,2,4,6,8};
  errorMessage = ()=> true;
  errorMessage = null;
  
  print("""
  $pokemon $hp
  $isAlive
  $abilities
  $sprites
  $errorMessage
  """);
}
