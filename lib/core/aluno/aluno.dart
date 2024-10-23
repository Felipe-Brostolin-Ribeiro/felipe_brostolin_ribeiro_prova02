class Aluno {
  final int? id;
  final String? nomeCompleto;
  final String? cidade;
  final String? curso;
  final String? email;
  final String? senha;

  Aluno({
    required this.id,
    required this.nomeCompleto,
    required this.cidade,
    required this.curso,
    required this.email,
    required this.senha,
  });

  static fromJson(Map<String, Object> json) {
    return Aluno(
      id: json['id'] as int?,
      nomeCompleto: json['nome_completo'] as String?,
      cidade: json['cidade'] as String?,
      curso: json['curso'] as String?,
      email: json['email'] as String?,
      senha: json['senha'] as String?,
    );
  }
}
