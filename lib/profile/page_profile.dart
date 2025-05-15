import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String ngaySinh = "19/12/2004";
  String gioiTinh = "Nam";
  List<String> nnlts = ["Tiếng Việt", "Java", "Python", "C#", "C/C++", "JS", "Pascal"];
  String? ngonNgu = "Python";
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _buildBody(index),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Lê Thanh Hải"),
                accountEmail: Text("hai0987738139@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: Text("VT", style: TextStyle(color: Colors.white),),
                  backgroundImage: AssetImage("asset/images/wanhne.jpg"),
                ),
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text("Inbox"),
              trailing: Text("10"),
            ),
            ListTile(
              leading: Icon(Icons.sms),
              title: Text("SMS"),
              trailing: Text("100"),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  index = 1;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.blue[750],
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.red,),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.message, color: Colors.yellow,),
                label: "SMS"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.phone, color: Colors.green,),
                label: "Phone"
            ),
          ],
        onTap: (value) {
            setState(() {
              index = value;
            });
        },
      ),
    );
  }

  Widget _buildHome() {
    return
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*3/4,
                  child: Image.asset
                    ("asset/images/wanhne.jpg"),
                ),
              ),
              SizedBox(height: 15,),
              Text("Họ và tên:"),
              Text("Lê Thanh Hải", style:
              TextStyle(fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),),
              SizedBox(height: 15),
              Text("Ngày sinh:"),
              Row(
                children: [
                  Expanded(child: Text(ngaySinh, style: TextStyle(fontSize: 16),)),
                  IconButton(onPressed: () async{
                    var seletedDate = await showDatePicker(context: context, firstDate: DateTime(1990), lastDate: DateTime(2040));
                    if(seletedDate != null) {
                      ngaySinh = "${seletedDate.day}/${seletedDate.month}/${seletedDate.year}";
                      setState(() {
                      });
                    }
                  }, icon: Icon(Icons.calendar_month)),
                  SizedBox(width: 30,)
                ],
              ),
              SizedBox(height: 15,),
              Text("Giới tính:"),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text("Nam"),
                      value: "Nam",
                      groupValue: gioiTinh,
                      onChanged: (value) {
                        setState(() {
                          gioiTinh = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text("Nữ"),
                      value: "Nữ",
                      groupValue: gioiTinh,
                      onChanged: (value) {
                        setState(() {
                          gioiTinh = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Text("Sở thích:"),
              Text("Ăn, ngủ, ỉa",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
              SizedBox(height: 15,),
              Text("Ngôn ngữ lập trình giỏi nhất:"),
              DropdownButton<String>(
                  isExpanded: true,
                  value: ngonNgu,
                  items: nnlts.map(
                        (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Row(
                          children: [
                            Icon(Icons.abc, size: 40, color: Colors.blue,),
                            SizedBox(width: 30,),
                            Text(e),
                          ],
                        )
                    ),
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      ngonNgu = value;
                    });
                  })
            ],
          ),
        ),
      );
  }
  Widget _buildSMS() {
    return Center(
      child: Text("SMS"),
    );
  }
  Widget _buildPhone() {
    return Center(
      child: Text("Phone"),
    );
  }
  Widget _buildBody(index) {
      switch(index) {
        case 0: return _buildHome();
        case 1: return _buildSMS();
        case 2: return _buildPhone();
      }
      return index;
  }
}
