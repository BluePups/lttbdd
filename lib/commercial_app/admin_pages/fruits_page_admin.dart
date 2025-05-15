import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:laptrinhtbdd/commercial_app/admin_pages/fruits_add_page.dart';
import 'package:laptrinhtbdd/commercial_app/admin_pages/fruits_update_page.dart';
import 'package:laptrinhtbdd/helper/dialogs.dart';
import 'package:laptrinhtbdd/commercial_app/models/model.dart';
import 'package:laptrinhtbdd/commercial_app/mywidgets/async_widget.dart';

class FruitsPageAdmin extends StatelessWidget {
  FruitsPageAdmin({super.key});
  late BuildContext myContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruits Admin"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: StreamBuilder<List<Fruit>>(
        stream: FruitSnapShot.getFruitStream(),
        builder: (context, snapshot) {
          myContext = context;
          return AsyncWidget(
              snapshot: snapshot,
              builder: (context, snapshot) {
                var list = snapshot.data! as List<Fruit>;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      Fruit fruit = list[index];
                      return Slidable(
                        key: const ValueKey(0),

                        // The end action pane is the one at the right or the bottom side.
                        endActionPane: ActionPane(
                          extentRatio: 0.6,
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => FruitsUpdatePage(fruit: fruit),)
                                );
                              },
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Cập nhật',
                            ),
                            SlidableAction(
                              onPressed: (context) async{
                                String? xacNhan = await showConfirmDialog(myContext, "Mày chắc ko???");
                                if(xacNhan == "ok") {
                                  FruitSnapShot.delete(fruit.id);
                                  ScaffoldMessenger.of(myContext).clearSnackBars();
                                  ScaffoldMessenger.of(myContext).showSnackBar(
                                    SnackBar(content: Text("Đã xóa ${fruit.ten}"))
                                  );
                                }
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete_forever,
                              label: 'Xóa',
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Image.network(fruit.anh?? "thay link ảnh mặc định vào đây")
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Số thứ tự: ${fruit.id}"),
                                    Text("Tên: " + fruit.ten, style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("Giá: ${fruit.gia} vnđ", style: TextStyle(color: Colors.red),),
                                    Text(fruit.moTa?? ""),
                                  ],
                                )
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(thickness: 1.5,),
                    itemCount: list.length,),
                );
              }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FruitsAddPage(),)
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
