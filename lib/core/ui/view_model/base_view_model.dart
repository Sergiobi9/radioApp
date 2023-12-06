import 'package:flutter/material.dart';
import 'package:radio_app/core/module/interface/i_base_module.dart';
import 'package:radio_app/core/ui/view_model/interface/i_base_view_model.dart';

class BaseViewModel with ChangeNotifier implements IBaseViewModel {
  bool _isLoading = false;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  bool isLoading() {
    return _isLoading;
  }
}
