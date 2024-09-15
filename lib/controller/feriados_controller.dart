import 'package:flutterteste/model/feriados_model.dart';
import 'package:flutterteste/model/feriados_repository.dart';
import 'package:intl/intl.dart';

class FeriadosController {
  FeriadosRepository repository = FeriadosRepository();

  Future<List<FeriadoEntity>> getFeriados() async {
    List<FeriadoEntity> list = await repository.getFeriados();
    //aqui eu poderia filtrar, formatar, regras, etc na LIST
    return list;
  }

  String GetMonth(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('dd/MMMM/yyyy', 'pt-Br').format(dateTime);
    String month = formattedDate.split('/')[1].substring(0, 3).toUpperCase();
    return month;
  }

  String GetDay(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('dd/MMMM/yyyy', 'pt-Br').format(dateTime);
    String day = formattedDate.split('/')[0];
    return day;
  }
}
