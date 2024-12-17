import 'dart:convert';
import 'models/user.dart';
import 'services/file_storage.dart';

class DBHelper {
  final FileStorage _fileStorage = FileStorage();

  // Recuperar usuários do arquivo JSON
  Future<List<User>> getUsers() async {
    List<User> users = [];
    try {
      String data = await _fileStorage.readFile();
      List<dynamic> jsonData = json.decode(data);
      users = jsonData.map((userJson) => User.fromJson(userJson)).toList();
    } catch (e) {
      // Caso o arquivo esteja vazio ou não exista, retornamos uma lista vazia
      users = [];
    }
    return users;
  }

  // Salvar usuário no arquivo JSON
  Future<void> saveUser(User user) async {
    List<User> users = await getUsers();
    users.add(user);
    
    // Salvar novamente no arquivo
    String jsonData = json.encode(users.map((user) => user.toJson()).toList());
    await _fileStorage.writeFile(jsonData);
  }
}
