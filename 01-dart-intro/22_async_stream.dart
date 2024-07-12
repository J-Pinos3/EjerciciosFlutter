Stream<int> countTo(int max) async*{
  int i = 0;
  while(i < max) yield i++;
}

void main() async {
  Stream s = countTo(5);
  await for(int i in s){
    print(i);
  }

  print("\n--------\n");
  countTo(5).listen((value) { 
    print(value);
  });
}