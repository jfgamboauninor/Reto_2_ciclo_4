import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/shopping_controller.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final ShoppingController shoppingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        //td
        // aquí debemos observar la variable total del shoppingController
        
        child: Obx( 
              () => Text('TOTAL USD : ''${shoppingController.total}',
            style: const TextStyle(
                fontSize: 30.0,
                color: Colors.blue,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400)),)
      ),
    );
  }
}
