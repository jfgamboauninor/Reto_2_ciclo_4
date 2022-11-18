import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/banner.dart';
import '../Widgets/cart_total.dart';
import 'product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Stack(
        children: [buildProfileImage(), customAppBar()],
      ),
      const SizedBox(
        height: 60,
      ),
      const Text("GRUPO 11 DEL 2287",
          style: TextStyle(
              fontSize: 30.0,
              color: Colors.black,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w400)),

      const SizedBox(
        height: 20,
      ),
      
      const Text("Javier Fernando Gamboa",
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.green,
              letterSpacing: 1.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),),

      const Text("Danilo José Gómez",
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.green,
              letterSpacing: 1.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),),

      const Text("Jhonnys de Avila",
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.green,
              letterSpacing: 1.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),),
      


      CartTotal()
    ]));
  }

  Widget buildProfileImage() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: const [
        CustomBanner(200),
        CircleAvatar(
          backgroundImage:
              //Image('assets/images/banner_ver.jpg', fit: BoxFit.cover),
              //Image.asset('assets/images/banner_ver.jpg', fit: BoxFit.cover),
              //NetworkImage("https://randomuser.me/api/portraits/men/75.jpg"),
              NetworkImage("https://thumbs.dreamstime.com/z/tienda-de-juguetes-para-beb%C3%A9s-y-logo-productos-dise%C3%B1o-ni%C3%B1os-o-beb%C3%A9-juguete-producto-estos-gr%C3%A1ficos-vienen-en-tipos-archivos-220459838.jpg"),
              
          radius: 80.0,
        )
      ],
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.to(() => ProductList(),
                transition: Transition.circularReveal,
                duration: const Duration(seconds: 1)),
            child: const Icon(
              Icons.shopping_cart,
              size: 50,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
