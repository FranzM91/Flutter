import 'package:desing/widgets/background.dart';
import 'package:desing/widgets/card_table.dart';
import 'package:desing/widgets/custom_bottom_navigation.dart';
import 'package:desing/widgets/page_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // fondo
          BackGround(),
          // cuerpo
          _HomeBody()
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // titulos
          PageTitle(),
          // card table
          CardTable()
        ],
      ),
    );
  }
}
