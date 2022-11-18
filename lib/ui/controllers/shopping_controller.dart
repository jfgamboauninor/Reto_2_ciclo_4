import 'dart:developer';

import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    int newTotal = 0;
    int primerArticulo = 0;
    int segundoArticulo = 0;



    // TODO
    // calcular el valor total de los elementos en el carro de compras
    var id = 0;
    log(id.toString());

    Product producto = entries.firstWhere(((element) => id == element.id));
    primerArticulo = producto.price * producto.quantity;
    log(producto.price.toString());
    log(producto.quantity.toString());
    log(primerArticulo.toString());

    id = 1;
    log(id.toString());

    producto = entries.firstWhere(((element) => id == element.id));
    segundoArticulo = producto.price * producto.quantity;
    log(producto.price.toString());
    log(producto.quantity.toString());
    log(segundoArticulo.toString());

    newTotal = primerArticulo + segundoArticulo;

    total.value = newTotal;
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    // TODO
    // Encontrar el elemento usando el id, revisar el método firstWhere de la lista
    // después obtener el index de ese elemento, revisar el método indexOf de la lista
    // después hacer el incremento en la cantidad
    // finalmente actualizar entries usando el indice y el elemento actualizado

    Product producto = entries.firstWhere(((element) => id == element.id));
    int index = entries.indexOf(producto);
    producto.quantity = producto.quantity + 1;
    entries[index] = producto;

    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    // TODO
    // similar a agregarProducto
    // validar cuando la cantidad es igual a cero

    Product producto = entries.firstWhere(((element) => id == element.id));
    int index = entries.indexOf(producto);

    if(producto.quantity > 0) {
        producto.quantity = producto.quantity - 1;

    }

    entries[index] = producto;

    calcularTotal();
  }
}
