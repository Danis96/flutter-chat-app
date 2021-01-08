import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/providers/bottom_navigation_provider.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/utils/size_config.dart';
import 'package:wallet/app/view/home/widgets/home_card_screen.dart';
import 'package:wallet/app/view/home/widgets/home_top_background_container.dart';
import 'package:wallet/common/common_empty_container.dart';

import '../../../../common/common_empty_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: commonEmptyContainer());
  }
}
