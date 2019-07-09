import 'package:flutter/cupertino.dart';
import 'package:cupertino/styles.dart';
import 'package:cupertino/view/product_list_tab.dart';
import 'package:cupertino/view/search_tab.dart';
import 'package:cupertino/view/shopping_cart.dart';


class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return CupertinoPageScaffold(
    //     navigationBar: CupertinoNavigationBar(
    //         middle: const Text('Cupertino Store'),
    //   ),
    //   child: Container(),
    // );

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Products')
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Search')
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('Cart')
          )
        ],  
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0: 
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ProductListTab()
              );
            }); //case 0
        
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SearchTab()
              );
            }); // case 1

          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ShoppingCartTab()
              );
            });
        } // switch
      },
    );
  }
}
