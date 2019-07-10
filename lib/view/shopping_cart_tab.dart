import "package:flutter/cupertino.dart";
import "package:provider/provider.dart";

import "package:cupertino/model/app_state_model.dart";

class ShoppingCartTab extends StatefulWidget {
  _ShoppingCartState createState() {
    return _ShoppingCartState();
  }
}

class _ShoppingCartState extends State<ShoppingCartTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return CustomScrollView(
          slivers: const <Widget> [
            CupertinoSliverNavigationBar(
              largeTitle: Text('Shopping Cart'),
            )
          ]
        );
      },
    );
  }
}