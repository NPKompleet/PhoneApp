import 'package:flutter/material.dart';
import 'package:phone_app/pages/contacts_page.dart';
import 'package:phone_app/pages/dial_number_page.dart';
import 'package:phone_app/pages/recents_page.dart';
import 'package:phone_app/pages/search_contact_page.dart';
import 'package:phone_app/pages/speed_dial_page.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).accentColor),
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => _openSearchContactPage(context)),
                hintText: 'Type a name or phone number',
                hintStyle: TextStyle(fontSize: 12.0),
                border: InputBorder.none,
              ),
            ),
          ),
          actions: <Widget>[
            PopupMenuButton(itemBuilder: (BuildContext context) {}),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                background: ListTile(
                  leading: CircleAvatar(
                    child: Text('A'),
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                  title: ListTile(
                    title: Text('Last Call'),
                    subtitle: Text('38 mins ago'),
                  ),
                  trailing: Icon(Icons.phone),
                ),
              ),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.dialer_sip,
                      color: Colors.lightBlue,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.recent_actors,
                      color: Colors.green,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.contacts,
                      color: Colors.yellow,
                    ),
                  ),
                ],
                indicatorSize: TabBarIndicatorSize.label,
              ),
            ),
            SliverFillRemaining(
              child: Stack(
                children: <Widget>[
                  TabBarView(
                    children: <Widget>[
                      SpeedDialPage(),
                      RecentsPage(),
                      ContactsPage(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FloatingActionButton(
                        onPressed: () => _openDialNumberPage(context),
                        tooltip: 'Dial Number',
                        child: Icon(Icons.dialpad),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
//        floatingActionButton: Align(
//          alignment: Alignment.bottomCenter,
//          child: FloatingActionButton(
//            onPressed: () {},
//            tooltip: 'Increment',
//            child: Icon(Icons.dialpad),
//          ),
//        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _openSearchContactPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchContactPage()),
    );
  }

  void _openDialNumberPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DialNumberPage()),
    );
  }
}
