import 'dart:io';

class FileStorage {
  // Caminho para o arquivo onde os dados serão armazenados
  final String filePath = 'users.json';

  // Ler dados do arquivo
  Future<String> readFile() async {
    try {
      final file = File(filePath);
      return await file.readAsString();
    } catch (e) {
      return '[]';  // Retorna uma lista vazia em caso de erro
    }
  }

  // Escrever dados no arquivo
  Future<void> writeFile(String data) async {
    final file = File(filePath);
    await file.writeAsString(data);
  }
}
