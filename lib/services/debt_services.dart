

import 'dart:convert';

import '../models/debt_model.dart';
import '../utilities/api_helpers.dart';

Resource<List<Datum>> getDeptApi() {
  return Resource(
      url: 'test_api/flutterTest.php?pageNo=1',
      parse: (response) {
        Map listMap = json.decode(response.body);
        Iterable list = listMap["data"];
        List<Datum> data = list.map((model) => Datum.fromJson(model)).toList();
        return data;
      });
}