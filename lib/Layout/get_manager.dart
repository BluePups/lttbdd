import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhtbdd/page_home.dart';

class ControllerSimpleState extends GetxController{
  int counter = 0;

  static ControllerSimpleState
  get({String? tag}) => Get.find<ControllerSimpleState>(tag: tag);
  void increase1(){
    counter++;
    update(["01"]);
  }
  void increase2(){
    counter++;
    update(["02"]);
  }
  void increaseAll(){
    counter++;
    update(["01", "02"]);
  }
}

class BindingController extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ControllerSimpleState(),);
  }
}

class BindingTempoController extends Bindings{

  @override
  void dependencies() {
    Get.create(() => ControllerSimpleState(), permanent: false);
  }
}

class GetXApp extends StatelessWidget {
  const GetXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX App",
      initialBinding: BindingController(),
      home: PageSimpleState(),
    );
  }
}


class PageSimpleState extends StatelessWidget {
  PageSimpleState({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Simple State"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<ControllerSimpleState>(
              id: "01",
              builder: (controller) => Text("01: ${controller.counter}",
                style: TextStyle(fontSize: 20),),
            ),
            GetBuilder<ControllerSimpleState>(
              id: "02",
              builder: (controller) => Text("02: ${controller.counter}",
                style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(
                onPressed: (){
                  ControllerSimpleState.get()
                      .increase1();
                },
                child: Text("increase 1")
            ),
            ElevatedButton(
                onPressed: (){
                  ControllerSimpleState.get()
                      .increase2();
                },
                child: Text("increase 2")
            ),
            ElevatedButton(
                onPressed: (){
                  ControllerSimpleState.get()
                      .increaseAll();
                },
                child: Text("increase all")
            ),
            ElevatedButton(
                onPressed: (){
                  Get.to(PageHome(),binding: BindingTempoController());
                },
                child: Text("Next")
            ),
          ],
        ),
      ),
    );
  }
}