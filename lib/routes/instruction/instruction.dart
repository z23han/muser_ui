import 'package:flutter/material.dart';
import 'package:muser_ui/routes/instruction/group/group_instruction.dart';
import 'package:muser_ui/routes/instruction/individual/individual_instruction.dart';

enum _Tab { TAB1, TAB2 }

class InstructionScreen extends StatefulWidget {
  final int tabIndex;
  const InstructionScreen({this.tabIndex});
  @override
  _InstructionScreenState createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen>
    with TickerProviderStateMixin {
  final List<Widget> _children = [IndividualInstruction(), GroupInstruction()];
  TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(vsync: this, length: 2, initialIndex: widget.tabIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double tabWidth = size.width * (30 / 360);
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 15,
            elevation: 0,
            title: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Theme.of(context).accentColor,
              indicatorWeight: 2,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 15),
              labelStyle: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  Theme.of(context).textTheme.headline5.copyWith(fontSize: 16),
              tabs: _Tab.values
                  .map((_Tab tab) => Container(
                      width: tabWidth, child: Tab(text: _getTabTitle(tab))))
                  .toList(),
            )),
        body: TabBarView(
          controller: _tabController,
          children: _children,
        ));
  }

  _getTabTitle(_Tab tab) {
    return tab == _Tab.TAB1 ? '个人' : '小组';
  }
}
