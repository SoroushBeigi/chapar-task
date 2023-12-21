
//Using a type(T) and param(P) to have a basic structure for all our usecases
//It's an abstraction that usecase classes extend from

abstract class Usecase<T,P>{
  Future<T> call(P param);
}