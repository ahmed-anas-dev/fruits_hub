abstract class Failure{
  final String message;
  Failure({required this.message});

}
  class ServerError extends Failure{
    ServerError({required super.message});
  }
