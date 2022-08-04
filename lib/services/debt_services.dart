

import 'dart:convert';

import '../models/debt_model.dart';
import '../utilities/api_helpers.dart';

Resource<DebtModel> getDeptApi(int id) {
  return Resource(
      url: 'test_api/flutterTest.php?pageNo=$id',
      parse: (response) {
        Map<String, dynamic> getDebtMap = json.decode(response.body);
        DebtModel debtResult = DebtModel.fromJson(getDebtMap);
        return debtResult;
      });
}