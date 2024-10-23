import 'package:flutter/material.dart';
import 'package:worldskills/features/disiciplinas/disciplinas.dart';

class DisciplinaCard extends StatelessWidget {
  const DisciplinaCard({super.key, required this.disciplinas});

  final Disciplinas disciplinas;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Text(disciplinas.nomeDisiciplina),
          ElevatedButton(
            onPressed: () {},
            child: Text("Acessar"),
          ),
        ],
      ),
    );
  }
}
