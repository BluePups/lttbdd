import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhtbdd/commercial_app/controllers/controller_fruit_haslistener.dart';
import 'package:laptrinhtbdd/commercial_app/page_chitiet_fruit.dart';
import 'package:badges/badges.dart' as badges;

class App_Fruits_Store extends StatelessWidget {
  const App_Fruits_Store({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fruits Store',
      initialBinding: BindingsHomeFruitStore2(),
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      useMaterial3: true,
    ),
      home: PageHomeFruitsStore(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageHomeFruitsStore extends StatelessWidget {
  const PageHomeFruitsStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit Store"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          GetBuilder(
            init: ControllerFruit2.get(),
            id:"gh",
            builder: (controller) => badges.Badge(
              showBadge: controller.slMHGH>0,
              badgeContent: Text('${controller.slMHGH}', style: TextStyle(color: Colors.white),),
              child: Icon(Icons.shopping_cart),
            ),),
          SizedBox(width: 20,)
        ],
      ),
      body: GetBuilder(

        init: ControllerFruit2.get(),
        id: "Fruits",
        builder: (controller) {
          var fruits = controller.fruits;
          return GridView.extent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 9,
            crossAxisSpacing: 5,
            childAspectRatio: 0.75,
            children: fruits.map(
                (e) {
                return Card(
            child: GestureDetector(
            child: Column(
                children: [
                Expanded(
                child: Container(
                child: Image.network(e.anh?? ""),
          ),
          ),
          Text(e.ten),
          Text("${e.gia?? 0} vnd"),
          ],
          ),
              onTap: () => {
              Get.to(PageChitietFruit(fruit: e))
              },
          ),
          );
          }
            ).toList(),
          );
        }),
    );
  }

}
