class HttpIOException implements Exception{
  int code;
  String message;
  HttpIOException(this.code,this.message);
}