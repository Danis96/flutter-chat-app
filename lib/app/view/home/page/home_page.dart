import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/providers/bottom_navigation_provider.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/utils/size_config.dart';
import 'package:wallet/app/view/home/widgets/home_card_screen.dart';
import 'package:wallet/app/view/home/widgets/home_top_background_container.dart';
import 'package:wallet/common/common_empty_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _widgetOptions = <Widget>[
    cardScreeen(),
    commonEmptyContainer(),
    commonEmptyContainer(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final BottomNavigationProvider navigationProvider =
        Provider.of(context, listen: true);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
        ],
        currentIndex: navigationProvider.selectedIndex,
        selectedItemColor: ColorHelper.walletBlue.color,
        onTap: navigationProvider.onItemTapped,
      ),
      body: Column(
        children: <Widget>[
          topBackgroundContainer(navigationProvider: navigationProvider),
          _widgetOptions.elementAt(navigationProvider.selectedIndex),
        ],
      ),
    );
  }
}
