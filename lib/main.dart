import "package:flutter/cupertino.dart";
import "package:flutter/services.dart";
import "package:cupertino/app.dart";

import "package:provider/provider.dart";
import "package:cupertino/model/app_state_model.dart";

void main () {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      builder: (context) => AppStateModel()..loadProducts(),
      child: CupertinoStoreApp(),
    )
  );
}