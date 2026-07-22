class CustomException implements Exception{
  String message;
  CustomException({required this.message});
  String toString(){
    return message;
  }
}