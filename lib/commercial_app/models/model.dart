import 'package:laptrinhtbdd/commercial_app/models/supabase_helper.dart';
import 'package:http/http.dart' as http;

class Fruit {
  int id;
  int? gia;
  String ten;
  String? moTa, anh;
  Fruit({required this.id, this.gia, required this.ten, this.moTa, this.anh});

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
      id: json["id"] as int,
      gia: json["gia"] as int,
      ten: json["ten"],
      moTa: json["moTa"],
      anh: json["anh"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "gia": this.gia,
      "ten": this.ten,
      "moTa": this.moTa,
      "anh": this.anh,
    };
  }
//
}

class FruitSnapShot {
  Fruit fruit;
  FruitSnapShot({required this.fruit});

  static Future<void> update(Fruit newFruit) async {
    await supabase.from("Fruit")
      .update(newFruit.toJson())
      .eq("id", newFruit.id);
  }

  static Future<dynamic> delete(int id) async {
    await supabase.from("Fruit")
      .delete()
      .eq("id", id);
    await deleteImage(bucket: "images",path: "images/fruit_${id}.jpg");
    return;
  }

  static Future<dynamic> insert(Fruit newFruit) async{
    var data = await supabase
        .from('Fruit')
        .insert(newFruit.toJson());
    return data;
  }

  static Future<List<Fruit>> getFruit() async {
    List<Fruit> fruits = [];
    final data = await supabase.from("Fruit").select();
    fruits = data.map((e) => Fruit.fromJson(e),).toList();
    return fruits;
  }

  static Future<Map<int, Fruit>> getMapFruit2() async {
    final data = await supabase.from("Fruit").select();
    var iterable = data.map((e) => Fruit.fromJson(e),).toList();
    Map<int, Fruit> _maps = Map.fromIterable(
      iterable, key: (fruit) => fruit.id, value: (fruit) => fruit,);
    return _maps;
  }

  static Future<Map<int, Fruit>> getMapFruits() async {
    return getMapData(
      table: "Fruit",
      fromJson: Fruit.fromJson,
      getId: (t) => t.id);
  }

  static Stream<List<Fruit>> getFruitStream() {
    return getDataStream<Fruit>(
        table: "Fruit",
        ids: ["id"],
        fromJson: (json) => Fruit.fromJson(json));
  }

  static listenFruitchange(Map<int, Fruit> maps, {Function()? updateUI}) async {
    return listenDatachange(
      maps,
      channel: "Fruit:public",
      schema: "public",
      table: "Fruit",
      fromJson: Fruit.fromJson,
      getId: (t) => t.id,
      updateUI: updateUI);
  // static List<Fruit> getALL() {
  //   return data;
  }
}

// final data =<Fruit> [
//   Fruit(id: 1, gia: 20000, ten: "Táo", moTa: "Táo đỏ nhập khẩu", anh: "https://th.bing.com/th/id/OIP.SH-MxwmIu9BlhY96-rdAtQHaGG?rs=1&pid=ImgDetMain"),
//   Fruit(id: 2, gia: 15000, ten: "Lê", moTa: "Lê xanh tươi ngon", anh: "https://th.bing.com/th/id/OIP.SH-MxwmIu9BlhY96-rdAtQHaGG?rs=1&pid=ImgDetMain"),
//   Fruit(id: 3, gia: 18000, ten: "Cam", moTa: "Cam ngọt không hạt", anh: "https://th.bing.com/th/id/OIP.P3bSZvjJGA8_fH0MDQb9PgHaHa?rs=1&pid=ImgDetMain"),
//   Fruit(id: 4, gia: 22000, ten: "Xoài", moTa: "Xoài cát Hòa Lộc", anh: "https://www.cayantrai.org/wp-content/uploads/2020/10/xoai-cat-hoa-loc-5.jpg"),
//   Fruit(id: 5, gia: 25000, ten: "Nho", moTa: "Nho Mỹ nhập khẩu", anh: "https://th.bing.com/th/id/OIP.W3JRyowuGD09DsHWKWoGYgHaFj?rs=1&pid=ImgDetMain"),
//   Fruit(id: 6, gia: 12000, ten: "Chuối", moTa: "Chuối sứ chín cây", anh: "https://th.bing.com/th/id/OIP.Px9OHQgXc0qgzG_MCyAYkQHaHa?rs=1&pid=ImgDetMain"),
//   Fruit(id: 7, gia: 30000, ten: "Dưa hấu", moTa: "Dưa hấu ruột đỏ", anh: "https://product.hstatic.net/200000460455/product/dua_20hau_20ruot_20do1_539983f42bb546d4aa52063bfcf0d69a_8a3b2bd1cd8441818855a879a853cdbb_master.jpg"),
//   Fruit(id: 8, gia: 17000, ten: "Dứa", moTa: "Dứa mật ngọt", anh: "https://th.bing.com/th/id/OIP.WxCZRdw0_Tleytnefo5IUwHaHa?rs=1&pid=ImgDetMain"),
//   Fruit(id: 9, gia: 20000, ten: "Bơ", moTa: "Bơ sáp Đắk Lắk", anh: "https://th.bing.com/th/id/OIP.QNlIMZsx1Y8e9TxWnyYGfwHaHa?rs=1&pid=ImgDetMain"),
//   Fruit(id: 10, gia: 28000, ten: "Mận", moTa: "Mận hậu Sơn La", anh: "https://hoptacxa.vn/images/02082019/5701642_8e479024c295e6a4644e20f4fd943df1.jpeg"),
