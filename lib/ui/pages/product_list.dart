import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/product.dart';
import '../Widgets/banner.dart';
import '../controllers/shopping_controller.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ShoppingController shoppingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [const CustomBanner(300), customAppBar()],
            ),
            // TODO
            // aquí debemos rodear el widget Expanded en un Obx para
            // observar los cambios en la lista de entries del shoppingController
            Obx( 
              () => Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: shoppingController.entries.length,
                  itemBuilder: (context, index) {
                    return _row(shoppingController.entries[index], index);
                  }),
            )
            )
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.0,
              semanticLabel: 'Return',
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product);
  }

  Widget _card(Product product) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green),
        borderRadius: const BorderRadius.all(Radius.circular(28.0),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(product.name),
        Text('USD  ' '${product.price.toString()}'),
        //Text('Total: xx usd =''${shoppingController.total}'
        Column(
          children: [
            IconButton(
                onPressed: () => shoppingController.agregarProducto(product.id),
                  // 
                  // aquí debemos llamar al método del controlador que
                  // incrementa el número de unidades del producto
                  // pasandole el product.id
                  
                icon:  Icon(Icons.arrow_upward,size: 24.0,semanticLabel: 'Return',)),
            IconButton(
                onPressed: () => shoppingController.quitarProducto(product.id),
                  // TDO
                  // aquí debemos llamar al método del controlador que
                  // disminuye el número de unidades del producto
                  // pasandole el product.id
                  
                
                icon:  Icon(Icons.arrow_downward,size: 24.0,semanticLabel: 'Return',))
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Quantity"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.quantity.toString()),
            ),
          ],
        )
      ]),
    );
  }
}
