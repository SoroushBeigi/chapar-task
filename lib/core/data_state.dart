// An abstract class used to categorize our data requests and indicate
// whether the data has been successfully received or if an error has occurred.
abstract class DataState<T>{
  final T? data;
  final String? error;

  const DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T>{
  const DataSuccess(T? data) : super(data, null);
}

class DataFailed<T> extends DataState<T>{
  const DataFailed(String error) : super(null, error);
}