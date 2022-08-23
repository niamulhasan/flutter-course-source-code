void main() {
  var childOb = Child();
  childOb.aCommonMethod();
}

abstract class Parent {
  String? parentProp1;
  String? parentProp2;

  String parentsMethod() {
    return "I am a method from parent class";
  }

  void anAbstractMethod();

  void aCommonMethod() {
    print("I am a common method from parent class");
  }
}

class Child extends Parent {
  String? childProp1;

  String childsMethod() {
    return "I am a method from child class";
  }

  @override
  void aCommonMethod() {
    print("I am the common method from child class");
  }

  @override
  void anAbstractMethod() {
    // TODO: implement anAbstractMethod
  }
}
