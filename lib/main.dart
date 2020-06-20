import 'package:flutter/material.dart';

///
void main() {
  runApp(FlutterDemosApp());
}

///
class FlutterDemosApp extends StatelessWidget {
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Tutorials',
        //App title
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage());
  }
}

///
class MainPage extends StatelessWidget {
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlutterFrameworkAppBar('HOME'),
      drawer: FlutterFrameworkDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
              'This app is made for practicing features of flutter framework.'),
        ),
      ),
    );
  }
}

///
class ListViewPage extends StatefulWidget {
  ///
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

///
class _ListViewPageState extends State<ListViewPage> {
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FlutterFrameworkAppBar('LIST VIEW'),
        drawer: FlutterFrameworkDrawer(),
        body: Center(
          child: Text('ListView__Page'),
        ));
  }
}

///
class FlutterFrameworkAppBar extends StatelessWidget with PreferredSizeWidget {
  ///
  final String _title;

  ///
  FlutterFrameworkAppBar(this._title);

  ///
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

///
class FlutterFrameworkDrawer extends StatelessWidget {
  ///
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
                child: Column(children: <Widget>[
              Container(
                  width: 56.0,
                  height: 56.0,
                  margin: EdgeInsets.only(bottom: 8.0),
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('image/optimus_prime.jpg')))),
              Text(
                'Shawn Han',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  'hanxiaolc@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ])),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('HOME'),
            onTap: () {
              // change app state...
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return MainPage();
              })); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('LIST VIEW'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return ListViewPage();
              })); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
