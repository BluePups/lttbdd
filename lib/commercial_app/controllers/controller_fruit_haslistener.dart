import 'package:get/get.dart';
import 'package:laptrinhtbdd/commercial_app/models/model.dart';

class ControllerFruit2 extends GetxController {
  Map<int, Fruit> _maps = {};
  var gh = <GH_Item>[];

  int get slMHGH => gh.length;
  static ControllerFruit2 get() => Get.find();
  Iterable<Fruit> get fruits => _maps.values;


  @override
  void onReady() async {
    super.onReady();

    _maps = await FruitSnapShot.getMapFruit2();
    update(["fruits"]);
    FruitSnapShot.listenFruitchange(
      _maps,
      updateUI: () => update(["fruits"]),
    );
  }

  void themMHGH(Fruit f) {
    for(var item in gh) {
      if(f.id == item.fruit.id) {
        item.sl++;
        return;
      }
    }

    gh.add(GH_Item(fruit: f, sl: 1));
    update(["gh"]);
  }
}

class BindingsHomeFruitStore2 extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ControllerFruit2(),
    );
  }
}

class GH_Item {
  Fruit fruit;
  int sl;

  GH_Item({required this.fruit, required this.sl});
}