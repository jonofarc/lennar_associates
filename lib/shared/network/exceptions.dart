/*
  custom class for exception-handling
*/
class ServerException implements Exception{
  final String message;

  const ServerException({required this.message});

}