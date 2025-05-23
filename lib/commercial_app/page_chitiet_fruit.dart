import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:laptrinhtbdd/commercial_app/controllers/controller_fruit_haslistener.dart';
import 'package:laptrinhtbdd/commercial_app/models/model.dart';
import 'package:badges/badges.dart' as badges;
import 'package:laptrinhtbdd/commercial_app/page_auth_user.dart';

class PageChitietFruit extends StatelessWidget {
  PageChitietFruit({super.key, required this.fruit});
  Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${fruit.ten}"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size  .width*0.95,
                  child: Image.network(fruit.anh?? "Linh anh mac dinh"),
                ),
              ),
              Text(fruit.ten, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Column(
                children: [
                  Row(
                    children: [
                      Text("${fruit.gia?? 0} vnd", style: TextStyle(color: Colors.red),),
                      SizedBox(width: 30,),
                      Text("${(fruit.gia?? 0)*1.2} vnd", style: TextStyle(decoration: TextDecoration.lineThrough),)
                    ],
                  ),
                ],
              ),
              Text("${fruit.moTa?? ""}", style: TextStyle(fontSize: 18),),
              SizedBox(height: 10,),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: 2.75,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 30.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(height: 10, width: 20,),
                  Text("2,75", style: TextStyle(color: Colors.red),),
                  SizedBox(height: 10, width: 20,),
                  Text("${1 + Random().nextInt(1000)} đánh giá"),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          if(response?.session!=null && response?.user!=null)
            ControllerFruit2.get().themMHGH(fruit)
          else
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PageFruitStoreLogin(),)
        ),
        },
        child: Icon(Icons.add_shopping_cart_outlined),
      ),
    );
  }
}

double getRating() {
  return Random().nextInt(201)/100 + 3;
}
