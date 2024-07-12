Function remember(int number){ //or just remember
  return ()=> print(number);
}

void main(List<String> args) {
  var jenny = remember(123);
  jenny();
}