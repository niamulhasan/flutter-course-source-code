void main() async {
  print("Line 1");
  await Future.delayed(Duration(seconds: 2), () {
    print("Line 2");
  });
  print("Line 3");
}
