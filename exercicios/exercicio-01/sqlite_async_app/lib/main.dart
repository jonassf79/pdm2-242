import 'dart:convert';
import 'dart:io';
import 'models/user.dart';
import 'services/file_storage.dart';
import 'db_helper.dart';

void main() async {
  // Exemplo de uso do DBHelper para armazenar usuários em JSON
  DBHelper dbHelper = DBHelper();
  
  // Criar alguns usuários de exemplo
  User user1 = User(name: 'Jonas', age: 28);
  User user2 = User(name: 'Maria', age: 25);
  
  // Salvar no "banco de dados" (arquivo JSON)
  await dbHelper.saveUser(user1);
  await dbHelper.saveUser(user2);
  
  // Recuperar e exibir usuários
  List<User> users = await dbHelper.getUsers();
  for (var user in users) {
    print('User: ${user.name}, Age: ${user.age}');
  }
}
