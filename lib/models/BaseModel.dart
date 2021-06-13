import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  //final BuildContext context;

  // ChangeNotifierProvider changeProvider;
  bool isBusy = false;

  BaseModel() {
    // changeProvider = Provider.of<ChangeNotifierProvider>(context);
  }

  void toggleBusy( { bool? value }){
    if (value != null)
      this.isBusy = value;
    else
      this.isBusy = !this.isBusy;
    notifyListeners();
  }
}