import 'package:flutter/material.dart';
import 'package:keley_app/models/BaseModel.dart';
import 'package:provider/provider.dart';

class ViewModelProvider<T extends BaseModel> extends StatelessWidget {
  final T model;
  final Widget Function(T model) builder;
  final Function? onModelReady;

  ViewModelProvider({
       required this.model, this.onModelReady, required this.builder});

  @override
  Widget build(BuildContext context) {
   // return ChangeNotifierProvider(create: (BuildContext context)  {});
    return ChangeNotifierProvider<T>(

      create: (BuildContext context) {
        if (onModelReady != null) {
          onModelReady!(model);
        }
        return model;
      },
      child: Consumer<T>(
        builder: (BuildContext context, T model, Widget? child) {
          return builder(model);
        }
      ),
    );
  }


}