import 'package:clip_path/my_clippath1.dart';
import 'package:clip_path/my_clippath2.dart';
import 'package:clip_path/my_clippath3.dart';
import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  static List _ic = [
    Icons.account_circle,
    Icons.home,
    Icons.help,
    Icons.storage,
    Icons.vpn_key
  ];

  List _name = [
    'Account',
    'Home',
    'Help',
    'Storage',
    'VPN',
  ];

  List _cl = [
    MyClipPath1(),
    MyClipPath2(),
    MyClipPath3(),
  ];

  Widget? _class;
  List isSelected = List.generate(_ic.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('List'),
          backgroundColor: Colors.black,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          titleTextStyle: TextStyle(fontSize: 20),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _ic.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        isSelected[index] = !isSelected[index];
                        if (isSelected[index] == isSelected[0]) {
                          isSelected[0] = true;
                          isSelected[1] = false;
                          isSelected[2] = false;
                          isSelected[3] = false;
                          isSelected[4] = false;
                          _class = _cl[0];
                        }
                        if (isSelected[index] == isSelected[1]) {
                          isSelected[0] = false;
                          isSelected[1] = true;
                          isSelected[2] = false;
                          isSelected[3] = false;
                          isSelected[4] = false;
                          _class = _cl[1];
                        }
                        if (isSelected[index] == isSelected[2]) {
                          isSelected[0] = false;
                          isSelected[1] = false;
                          isSelected[2] = true;
                          isSelected[3] = false;
                          isSelected[4] = false;
                          _class = _cl[2];
                        }
                        if (isSelected[index] == isSelected[3]) {
                          isSelected[0] = false;
                          isSelected[1] = false;
                          isSelected[2] = false;
                          isSelected[3] = true;
                          isSelected[4] = false;
                        }
                        if (isSelected[index] == isSelected[4]) {
                          isSelected[0] = false;
                          isSelected[1] = false;
                          isSelected[2] = false;
                          isSelected[3] = false;
                          isSelected[4] = true;
                        }
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        Icon(
                          _ic[index],
                          color: isSelected[index] ? Colors.blue : Colors.black,
                        ),
                        Text(
                          _name[index],
                          style: TextStyle(
                            color:
                                isSelected[index] ? Colors.blue : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 500,
              width: 500,
              color: Colors.blue,
              child: _class,
            ),
          ],
        ),
      ),
    );
  }
}
