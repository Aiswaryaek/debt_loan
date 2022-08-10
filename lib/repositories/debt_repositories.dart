// ignore_for_file: prefer_typing_uninitialized_variables

import '../services/debt_services.dart';
import '../services/web_services.dart';

class DebtRepository{
  var webService;
  DebtRepository() {
    webService = Webservice();
  }
  Future getDebtData() => webService?.get(getDeptApi());
}