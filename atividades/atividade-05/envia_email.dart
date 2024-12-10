import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() async {

  String username = 'jonasfreitas016@gmail.com';
  String password = 'sxzq pxjw sklf lgmo';

  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = Address(username, 'Jonas Freitas')
    ..recipients.add('jonas.freitas07@aluno.ifce.edu.br')
    ..subject = 'oi'
    ..text = 'teste';

  try {
    final sendReport = await send(message, smtpServer);
    print('E-mail enviado com sucesso: ${sendReport.toString()}');
  } catch (e) {
    print('Falha ao enviar o e-mail: $e');
  }
}
