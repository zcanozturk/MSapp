import 'package:flutter/material.dart';
import 'package:get/get.dart';

getDrawer() {
  return Drawer(
    child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: Get.width * 0.04),
                    width: Get.width * 0.5,
                    child: Image.asset('assets/images/rbt.PNG'),
                  )
                ],
              )),
          ListTile(
            title: Text('Operand'),
            leading: Icon(Icons.home),
            onTap: () {
              print('Some Navigation Comes Here!');
            },
          ),
                    ListTile(
            title: Text('Operand'),
            leading: Icon(Icons.home),
            onTap: () {
              print('Some Navigation Comes Here!');
            },
          ),
                    ListTile(
            title: Text('Operand'),
            leading: Icon(Icons.home),
            onTap: () {
              print('Some Navigation Comes Here!');
            },
          ),
                    ListTile(
            title: Text('Operand'),
            leading: Icon(Icons.home),
            onTap: () {
              print('Some Navigation Comes Here!');
            },
          ),
                    ListTile(
            title: Text('Operand'),
            leading: Icon(Icons.home),
            onTap: () {
              print('Some Navigation Comes Here!');
            },
          ),
        ],
      ),
    ),
  );
}
