import 'package:flutter/material.dart';
import "package:get/get.dart";

class ControllerCounter extends GetxController {
  final _counter = 0.obs;
  int get counter => _counter.value;

  void increase() {
    _counter.value++;
  }

  void decrease() {
    _counter.value--;
  }
}

class PageCounterGetx extends StatelessWidget {
  PageCounterGetx({super.key});

  final controllerCounter = Get.put(ControllerCounter());
  final controllerCounter2 = Get.put(ControllerCounter(), tag: "My Tag");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              "controller: ${controllerCounter.counter}",
              style: TextStyle(fontSize: 24),
            )),
            GetX<ControllerCounter>(
              tag: "My Tag", // Ensure the tag is correct and consistent
              builder: (controllerCounter) => Text(
                "controller2: ${controllerCounter.counter}",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controllerCounter.increase();
              },
              child: Text(" + ", style: TextStyle(fontSize: 25)),
            ),
            ElevatedButton(
              onPressed: () {
                controllerCounter2.decrease();
              },
              child: Text(" - ", style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
