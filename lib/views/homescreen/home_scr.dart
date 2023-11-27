import 'package:emart_app/controller/home_controller.dart';
import 'package:emart_app/views/Cart_screen/cart_screen.dart';
import 'package:emart_app/views/category_screen/categories_screen.dart';
import 'package:emart_app/views/homescreen/home_screeen.dart';
import 'package:emart_app/views/profile_screen/profile_scr.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      var controller=Get.put(HomeController());

    var navbarItem =[
      BottomNavigationBarItem(icon: Image.asset(icHome,width:26),label:home),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width:26),label:categories),
      BottomNavigationBarItem(icon: Image.asset(icCart,width:26),label:cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width:26),label:account)
    ];

    var navBody=[
      const HomScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
      // Container(color:Colors.blue),
      // Container(color: Colors.amber),
      // Container(color: Colors.purple),
      // Container(color: Colors.cyan),


    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(()=>Expanded(child: navBody.elementAt(controller.currentNavindex.value))),
        ],
      ),
      bottomNavigationBar:Obx(()=> BottomNavigationBar(
        currentIndex: controller.currentNavindex.value,
        selectedItemColor: redColor,
        selectedLabelStyle: const TextStyle(fontFamily: semibold),
        type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items:navbarItem,
          onTap:(value){
          controller.currentNavindex.value=value;
          }
      ),
      )
    );
  }
}
