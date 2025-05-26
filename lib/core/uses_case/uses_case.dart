abstract class UsesCase<Type ,Params> {
  Future<Type> call([Params? params]);
}

class NoParam {}
