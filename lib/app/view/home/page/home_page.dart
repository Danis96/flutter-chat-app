import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/providers/auth_provider.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/utils/shared_preffs.dart';
import 'package:wallet/app/utils/size_config.dart';
import 'package:wallet/app/view/home/widgets/home_app_bar.dart';
import 'package:wallet/common/common_empty_container.dart';

import '../../../../common/common_empty_container.dart';
import '../../../utils/color_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: true);

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorHelper.chatBlack.color,
      appBar: homeAppBar(
        context: context,
      ),
      body: commonEmptyContainer(),
    );
  }
}
