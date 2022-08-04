import '../services/debt_services.dart';
import '../services/web_services.dart';

class DebtRepository{
  var webService;
  DebtRepository() {
    webService = Webservice();
  }
  Future getDebtData(int id) => webService?.get(getDeptApi(id));
}