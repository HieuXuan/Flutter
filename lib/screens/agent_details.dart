
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';



import '../widgets/agentDetailsTabBar.dart';
import '../components/agentdetails_components.dart';

class AgentDetails extends StatefulWidget {
  @override
  _AgentDetailsState createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ContactUsBody(),
      ),
    );
  }
}

class ContactUsBody extends StatefulWidget {
  @override
  _ContactUsBodyState createState() => _ContactUsBodyState();
}

class _ContactUsBodyState extends State<ContactUsBody>
    with TickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollViewController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:dividerColor,
      child: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                brightness: Brightness.dark,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'Agent Details',
                  style: TextStyle(color: Colors.black),
                ),
                pinned: true,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: firstHalfOfAgentDetails(context),
                ),
                floating: false,
                expandedHeight: MediaQuery.of(context).size.height * 0.4 + 120,
                bottom: AgentDetailsTabBar(_tabController),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              introduction(),
              contactInformation(_tabController)
            ],
          )),
    );
  }
}
