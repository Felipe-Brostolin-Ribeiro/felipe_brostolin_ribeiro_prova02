class Disciplinas {
  final int id;
  final String descricao;
  final String nomeDisiciplina;

  Disciplinas(
      {required this.id,
      required this.descricao,
      required this.nomeDisiciplina});

  static Disciplinas fromJson(Map<String, Object> json) {
    return Disciplinas(
      id: json['id'] as int,
      descricao: json['descricao'] as String,
      nomeDisiciplina: json['nome_disciplina'] as String,
    );
  }
}
