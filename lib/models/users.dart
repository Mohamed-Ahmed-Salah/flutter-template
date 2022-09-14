class Users {
  String name;
  String phone;
  String? whatsapp;
  String userId;
  String email;

  Users(
      {required this.userId,
      required this.name,
      required this.email,
      this.whatsapp,
      required this.phone});
}
