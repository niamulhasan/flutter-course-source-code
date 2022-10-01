void main() {
  print("Line 1");

  Future<String> x = Future.delayed(Duration(seconds: 2), () {
    return "Hello I'm Line 2";
  });

  x.then((data) {
    print(data);
    print("Line 3");
  });

  print("Line 4");
}


// String
// Future<String>

// int
// Future<int>

// Map
// Future<Map>
