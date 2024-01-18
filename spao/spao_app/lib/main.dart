import 'package:flutter/material.dart';
import 'package:spao_app/components/spao_item_info.dart';
import 'package:spao_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: CartPage(),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCartAppBar(),
      body: ListView(
        children: [
          SpaoItemInfo(),
        ],
      ),
    );
  }

  // 앱바 
  AppBar _buildCartAppBar(){
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_bag),
          onPressed: (){}, 
        ),
        SizedBox(width: 16,),
      ],
    );
  }
}