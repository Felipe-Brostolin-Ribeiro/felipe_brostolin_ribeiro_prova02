class Login {

  final String email;

  final String senha;

  Login({required this.email, required this.senha});

  static Login fromJson (Map<String, Object> json) {
    return Login(
     email:  json['email'] as String,
      senha: json['senha'] as String
    );
  }

}