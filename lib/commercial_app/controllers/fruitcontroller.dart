import 'package:get/get.dart';
import 'package:laptrinhtbdd/commercial_app/models/model.dart';

class ControllerFruit extends GetxController {
  var fruits = <Fruit>[];
  var gh = <ItemGH>[];

  int get slMHGH => gh.length;
  static ControllerFruit get() => Get.find();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _docDL();
  }

  _docDL() async{
    fruits = await FruitSnapShot.getFruit();
    update(["Fruits"]);
  }

  void themMHGH(Fruit f) {
    for(var item in gh) {
      if(f.id == item.fruit.id);
      item.sl++;
      return;
    }
    gh.add(ItemGH(fruit: f, sl: 1));
    update(["gh"]);
  }
}

class BindingsHomeFruitsStore extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>ControllerFruit(),);
  }
}

class ItemGH {
  Fruit fruit;
  int sl;

  ItemGH({required this.fruit, required this.sl});
}