// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterParams {
  final String name;
  final String email;
  final String password;
  final String? photoUrl;

  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    this.photoUrl,
  });
}
