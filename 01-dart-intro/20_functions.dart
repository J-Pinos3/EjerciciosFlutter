void greet({required String name, String message = "I like pizza."}){
  print("Hi $name, I wanted to say: $message");
}


main(){
  greet(name: "Jhonny");

  greet(name: "Jack", message: "I love hamburguers");
}