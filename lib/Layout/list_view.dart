import 'package:flutter/material.dart';

class PageListView extends StatelessWidget {
  PageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("My list view"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var itemData = data[index];
            return ListTile(
                leading: Text("${index + 1},", style: TextStyle(fontSize: 16),),
                title: Text(itemData.ten),
                subtitle: Text("Trai cay viet gap", style: TextStyle(fontStyle: FontStyle.italic),),
                trailing: Text("${itemData.gia} VND",style: TextStyle(color: Colors.red),),
                onTap: (){
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Bạn đã chọn sản phẩm ${itemData.ten}"),
                        duration: Duration(seconds: 5),
                      ));
                }
            );
          },
          separatorBuilder: (context, index) => Divider
            (thickness: 1.5,),
          itemCount: data.length
      ),
    );
  }
}

class SanPham{
  String ten;
  int gia;

  SanPham({
    required this.ten,
    required this.gia,
  });
}

var data = [
  SanPham(ten: "Chuối", gia: 25000),
  SanPham(ten: "Bưởi", gia: 35000),
  SanPham(ten: "Chôm Chôm", gia: 55000),
  SanPham(ten: "Bơ", gia: 25000),
  SanPham(ten: "Mít", gia: 40000),
  SanPham(ten: "Mãng Cầu", gia: 27000),
  SanPham(ten: "Dưa Chuột", gia: 29000),
  SanPham(ten: "Dừa", gia: 10000),
  SanPham(ten: "Măng Cụt", gia: 48000),
  SanPham(ten: "Sơri", gia: 22000),
  SanPham(ten: "Me", gia: 35000),
  SanPham(ten: "Sầu Riêng", gia: 95000),
  SanPham(ten: "Cam", gia: 15000),
  SanPham(ten: "Quýt", gia: 65000),
  SanPham(ten: "Táo", gia: 31000),
];