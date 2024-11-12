import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((dep) => dep.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeProjeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeProjeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((func) => func.toJson()).toList(),
    };
  }
}

void main() {
  // 1. Criar vários objetos Dependentes.
  Dependente dep1 = Dependente("Jonas");
  Dependente dep2 = Dependente("Enzo");

  // 2. Criar vários objetos Funcionário.
  Funcionario fun1 = Funcionario("Ronaldo", [dep2]);
  Funcionario fun2 = Funcionario("Taveira", [dep1, dep2]);

  // 4. Criar uma lista de Funcionários.
  List<Funcionario> funcionarios = [fun1, fun2];
 
  // 5. Criar um objeto Equipe Projeto.
  EquipeProjeto eqp1 = EquipeProjeto("Nash", funcionarios);

  // 6. Printar no formato JSON o objeto Equipe Projeto.
  String jsonEquipe = jsonEncode(eqp1.toJson());
  print(jsonEquipe);
}
