import 'package:flutter/material.dart';
import 'User_dashboardTabAll.dart' as second;
import 'User_dahboardallrestro.dart'as first;
import 'User_dashboardAirportrestro.dart' as third;

class user_maindashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: choices.length,

        child: new Scaffold(
          appBar: new AppBar(
            centerTitle: true,
            backgroundColor: Colors.grey,
            title: Text("Location", textAlign: TextAlign.center),
            actions: <Widget>[
              FlatButton(
                textColor: Colors.white,
                onPressed: () {},
              ),
            ],

            //title: const Text('Dashboard'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),


          ),

          drawer: new Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text(
                    'Your Account',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 25),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('asset/coffee.gif')
                      )),
                ),
                ListTile(
                  leading: Icon(Icons.input),
                  title: Text('Welcome'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MaterialApp()),
                    );

                  },
                ),
                ListTile(
                  leading: Icon(Icons.verified_user),
                  title: Text('Profile'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: Icon(Icons.border_color),
                  title: Text('Feedback'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
              ],
            ),
          ),
          body:
          new TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: ChoicePage(
                  choice: choice,
                ),
              );
            }).toList(),
          ),

          //new Center(child: _widgetOptions.elementAt(_selectedIndex),),

          bottomNavigationBar: BottomNavigationBar(
            //Center(child: _widgetOptions.elementAt(_selectedIndex),),
            type: BottomNavigationBarType.fixed,
            //currentIndex: _currentIndex,
            //currentIndex: model.currentIndex,
            //onTap: onTabTapped,

            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text('Search')
                //actions: [searchBar.getSearchAction(context)],
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_location), title: Text('Location')),
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box), title: Text('Profile')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz), title: Text('More')),

            ],
            /*onTap: (Index){
              setState(()
              {
                _currentIndex = index;
              });
            }*/
            //currentIndex: _selectedIndex,
            //selectedItemColor: Colors.amber[800],
            //onTap: _onItemTapped,
          ),

        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'All', icon: Icons.home),
  Choice(title: 'Restaurant', icon: Icons.restaurant),
  Choice(title: 'Airport', icon: Icons.local_airport),
  Choice(title: 'Medical', icon: Icons.local_hospital),
  Choice(title: 'Food', icon: Icons.fastfood),
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;
  // TabController controller;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: TabBarView(
          //controller: controller,
          //mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new second.dashboard_malls(),
            new second.dashboard_malls(),
            new third.dashboard_airport(),
            new second.dashboard_malls(),
            new second.dashboard_malls(),

          ],
        ),
      ),
    );
  }
}













