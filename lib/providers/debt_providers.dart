import 'package:flutter/material.dart';
import '../core/live_data.dart';
import '../core/ui_state.dart';
import '../models/debt_model.dart';
import '../repositories/debt_repositories.dart';

class GetDebtProvider extends ChangeNotifier {
  DebtRepository debtRepository;
  GetDebtProvider({required this.debtRepository});

  var getDebt = DebtModel();
  LiveData<UIState<DebtModel>> getDebtData =
  LiveData<UIState<DebtModel>>();

  LiveData<UIState<DebtModel>> getMyDebtsLiveData() {
    return getDebtData;
  }

  void initialState()
  {
    getDebtData.setValue(Initial());
    notifyListeners();
  }

 dynamic getMyDebts(int  id) async {
    try {
      getDebtData.setValue(IsLoading());
      getDebt = await debtRepository.getDebtData(id);
      if (getDebt.data != null) {
        getDebtData.setValue(Success(DebtModel()));
      } else {
        getDebtData.setValue(Failure(getDebt.toString()));
      }
    } catch (ex) {
      getDebtData.setValue(Failure(ex.toString()));
    } finally {
      notifyListeners();
    }
    // return true;
  }
}