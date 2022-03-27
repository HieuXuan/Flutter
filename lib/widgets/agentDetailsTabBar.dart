
import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';



class AgentDetailsTabBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _AgentDetailsTabBarState createState() => _AgentDetailsTabBarState();
  final TabController _tabController;

  AgentDetailsTabBar(this._tabController);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}

class _AgentDetailsTabBarState extends State<AgentDetailsTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: Colors.white,
      child: TabBar(
        controller: widget._tabController,
        labelColor: primaryColor,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(
            child: Text(
              'Introduction',
            ),
          ),
          Tab(
            child: Text('Contact Information'),
          )
        ],
      ),
    );
  }
}
