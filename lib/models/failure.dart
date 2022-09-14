class Failure {
  // Use something like "int code;" if you want to translate error messages
  final String message;
   String code;

  Failure({required this.message, this.code = ''});

  @override
  String toString() => message;
}