import "package:flutter/foundation.dart" as Foundation;
import "package:cupertino/model/product.dart";
import "package:cupertino/model/products_repository.dart";

double _salesTaxRate = 0.06;
double _shippingCostPerItem = 7;

class AppStateModel extends Foundation.ChangeNotifier {
  List<Product> _availableProducts;
  Category _selectedCategory = Category.all;


  final _productsInCart = <int, int>{};

  Map<int, int> get productsInCart {
    return Map.from(_productsInCart);
  }

  int get totalCartQuantity {
    return _productsInCart.values.fold(0, (accumulator, value) {
      return accumulator + value;
    });
  }

  Category get selectedCategory {
    return _selectedCategory;
  }

  double get subtotalCost {
    return _productsInCart.keys.map((id) {
      return _availableProducts[id].price * _productsInCart[id];
    }).fold(0, (accumulator, value) {
      return accumulator + value;
    });
  }

  double get shippingCost {
    return _shippingCostPerItem * _productsInCart.values.fold(0, (accumulator, itemCount) {
      return accumulator + itemCount;
    });
  }


  double get tax {
    return subtotalCost * _salesTaxRate;
  }

  double get totalCost {
    return subtotalCost + shippingCost + tax;
  }

  List<Product> getProducts() {
    if (_availableProducts == null) {
      return [];
    }

    if (_selectedCategory == Category.all) {
      return List.from(_availableProducts);
    } else {
      return _availableProducts.where((product) {
        return product.category == _selectedCategory;
      }).toList();
    }
  } // getProducts

  // Search the product catalog
  List<Product> search(String searchTerms) {
    return getProducts().where((product) {
      return product.name.toLowerCase().contains(searchTerms.toLowerCase());
    }).toList();
  }
  // Adds a product to the cart.
  void addProductToCart(int productId) {
    if (!_productsInCart.containsKey(productId)) {
      _productsInCart[productId] = 1;
    } else {
      _productsInCart[productId]++;
    }

    notifyListeners();
  }

  // Removes a product to the cart.
  void removeItemFromCart(int productId) {
    if (_productsInCart.containsKey(productId) == 1) {
      if (_productsInCart[productId] == 1) {
        _productsInCart.remove(productId);
      } else {
        _productsInCart[productId]--;
      }
    } 

    notifyListeners();
  }

  // Returns the Product instance matching the provided id.
  Product getProductById(int id) {
    return _availableProducts.firstWhere((product) {
      return product.id == id;
    });
  }

  void clearCart() {
    _productsInCart.clear();
    notifyListeners();
  }

  void loadProducts() {
    _availableProducts = ProductRepository.loadProducts(Category.all);
    notifyListeners();
  }

  void setCategory(Category newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }

}