abstract class UsesCase<Type> {
  Future<Type> call();
}

class NoParam {}
